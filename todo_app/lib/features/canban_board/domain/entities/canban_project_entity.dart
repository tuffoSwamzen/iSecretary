import 'package:equatable/equatable.dart';
import 'package:todo_app/features/canban_board/domain/entities/canban_status_enum.dart';
import 'package:todo_app/features/todo/data/models/project_model.dart';

class CanbanProjectEntity extends Equatable {
  final String title;
  final String id;
  final CanbanStatusEnum canbanStatusEnum;

  const CanbanProjectEntity({
    required this.title,
    required this.id,
    this.canbanStatusEnum = CanbanStatusEnum.toBeDone,
  });

  factory CanbanProjectEntity.fromModel(ProjectModel projectModel) {
    return CanbanProjectEntity(
      title: projectModel.name,
      id: projectModel.id,
      canbanStatusEnum: projectModel.status,
    );
  }

  ProjectModel toModel() {
    return ProjectModel(name: title, id: id, status: canbanStatusEnum);
  }

  CanbanProjectEntity copyWith({String? title, CanbanStatusEnum? newStatus}) {
    return CanbanProjectEntity(
      title: title ?? this.title,
      id: id,
      canbanStatusEnum: newStatus ?? canbanStatusEnum,
    );
  }

  @override
  List<Object?> get props => [id];
}
