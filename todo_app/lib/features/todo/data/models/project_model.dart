import 'package:todo_app/features/canban_board/domain/entities/canban_status_enum.dart';
import 'package:uuid/uuid.dart';

class ProjectModel {
  static const _todosKey = 'todos';
  static const _nameKey = 'name';
  static const _idKey = "id";
  static const _statusKey = "status";

  final String name;
  final String id;
  final CanbanStatusEnum status;

  ProjectModel({
    required this.name,
    String? id,
    this.status = CanbanStatusEnum.toBeDone,
  }) : id = id ?? const Uuid().v1(); // 👈 nur wenn id == null, dann neue ID

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    name: json[_nameKey],
    id: json[_idKey],
    status: CanbanStatusEnumJson.fromJson(json[_statusKey]),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    _todosKey: [],
    _nameKey: name,
    _idKey: id,
    _statusKey: status.toJson(),
  };
}
