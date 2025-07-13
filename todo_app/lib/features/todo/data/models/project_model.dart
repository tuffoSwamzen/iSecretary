import 'package:uuid/uuid.dart';

class ProjectModel {
  static const _todosKey = 'todos';
  static const _nameKey = 'name';
  static const _idKey = "id";

  final String name;
  final String id;

  ProjectModel({required this.name, String? id})
    : id = id ?? const Uuid().v1(); // 👈 nur wenn id == null, dann neue ID

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      ProjectModel(name: json[_nameKey], id: json[_idKey]);

  Map<String, dynamic> toJson() => <String, dynamic>{
    _todosKey: [],
    _nameKey: name,
    _idKey: id,
  };
}
