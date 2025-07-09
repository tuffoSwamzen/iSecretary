import 'package:todo_app/features/canban_board/domain/entities/canban_project_entity.dart';
import 'package:todo_app/features/canban_board/domain/entities/canban_status_enum.dart';
import 'package:todo_app/features/todo/domain/project_repository.dart';

class SwitchStatusOfCanbanEntity {
  final ProjectRepository projectRepository;

  SwitchStatusOfCanbanEntity({required this.projectRepository});

  void call({
    required CanbanProjectEntity project,
    required bool isUpwards,
  }) async {
    int oldStatusIndex = project.canbanStatusEnum.index;

    final newStatus =
        CanbanStatusEnum.values[(isUpwards
                ? --oldStatusIndex
                : ++oldStatusIndex)
            .clamp(0, CanbanStatusEnum.values.length)];
    final updatedProject = project.copyWith(
      title: project.title,
      newStatus: newStatus,
    );
    projectRepository.updateProject(updatedProject.toModel());
  }
}
