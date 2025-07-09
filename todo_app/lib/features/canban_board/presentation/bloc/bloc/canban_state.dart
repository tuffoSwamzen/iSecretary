part of 'canban_bloc.dart';

@immutable
sealed class CanbanState {
  final List<CanbanProjectEntity>? canbanProjectEntityList;
  final CanbanProjectEntity? selectedProject;

  const CanbanState({this.canbanProjectEntityList, this.selectedProject});
}

final class CanbanInitializingState extends CanbanState {
  const CanbanInitializingState();
}

final class CanbanBaseState extends CanbanState {
  const CanbanBaseState({super.canbanProjectEntityList, super.selectedProject});
}
