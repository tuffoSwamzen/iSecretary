import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/canban_board/domain/entities/canban_project_entity.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/add_project.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/delete_all_projects.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/get_all_canban_project_entities.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/get_all_projects_with_given_status.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/switch_status_of_canban_entity.dart';

part 'canban_event.dart';
part 'canban_state.dart';

class CanbanBloc extends Bloc<CanbanEvent, CanbanState> {
  CanbanBloc({
    required this.getAllProjects,
    required this.getAllProjectsWithGivenStatus,
    required this.addProject,
    required this.switchStatusOfCanbanEntity,
    required this.deleteAllProjects,
  }) : super(CanbanInitializingState()) {
    on<InitializeEvent>(onInitializeEvent);
    on<CreateProjectEvent>(onCreateProject);
    on<SwitchTaskModeEvent>(onCanbanSwitchTaskMode);
    on<SelectedProjectEvent>(onSelectedProject);
    on<DeleteAllProjectsEvent>(onDeleteAllProjects);
  }
  final GetAllCanBanProjectEntities getAllProjects;
  final GetAllProjectsWithGivenStatus getAllProjectsWithGivenStatus;
  final AddProject addProject;
  final SwitchStatusOfCanbanEntity switchStatusOfCanbanEntity;
  final DeleteAllProjects deleteAllProjects;

  FutureOr<void> onCanbanSwitchTaskMode(
    SwitchTaskModeEvent event,
    Emitter<CanbanState> emit,
  ) async {
    if (state.selectedProject == null) return;
    switchStatusOfCanbanEntity(
      project: state.selectedProject!,
      isUpwards: event.isChangedUp,
    );
    emit(await _emitNewState());
  }

  FutureOr<void> onInitializeEvent(
    InitializeEvent event,
    Emitter<CanbanState> emit,
  ) async {
    List<CanbanProjectEntity>? projects = await getAllProjects();

    emit(await _emitNewState(updatedProjects: projects));
  }

  FutureOr<void> onCreateProject(
    CreateProjectEvent event,
    Emitter<CanbanState> emit,
  ) async {
    addProject(event.title);
    emit(await _emitNewState());
  }

  FutureOr<void> onSelectedProject(
    SelectedProjectEvent event,
    Emitter<CanbanState> emit,
  ) async {
    emit(await _emitNewState(selectedProject: event.selectedProject));
  }

  Future<void> onDeleteAllProjects(
    DeleteAllProjectsEvent event,
    Emitter<CanbanState> emit,
  ) async {
    deleteAllProjects();
    emit(await _emitNewState());
  }

  Future<CanbanBaseState> _emitNewState({
    List<CanbanProjectEntity>? updatedProjects,
    CanbanProjectEntity? selectedProject,
  }) async {
    return CanbanBaseState(
      canbanProjectEntityList: updatedProjects,
      selectedProject: selectedProject,
    );
  }
}
