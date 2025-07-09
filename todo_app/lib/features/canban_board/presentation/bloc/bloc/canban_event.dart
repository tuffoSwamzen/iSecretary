part of 'canban_bloc.dart';

@immutable
sealed class CanbanEvent {
  final DateTime day;

  const CanbanEvent({required this.day});
}

class InitializeEvent extends CanbanEvent {
  const InitializeEvent({required super.day});
}

class SwitchTaskModeEvent extends CanbanEvent {
  final bool isChangedUp;
  const SwitchTaskModeEvent({required this.isChangedUp, required super.day});
}

class CreateProjectEvent extends CanbanEvent {
  final String title;

  const CreateProjectEvent({required this.title, required super.day});
}

class SelectedProjectEvent extends CanbanEvent {
  final CanbanProjectEntity selectedProject;

  const SelectedProjectEvent({
    required this.selectedProject,
    required super.day,
  });
}

class DeleteAllProjectsEvent extends CanbanEvent {
  const DeleteAllProjectsEvent({required super.day});
}
