import 'package:uuid/uuid.dart';

class PlannerAction {
  static const _idKey = 'id';
  static const _nameKey = 'name';

  final String id;
  final String name;

  PlannerAction({required this.name, String? id})
    : id = id ?? const Uuid().v1();

  factory PlannerAction.fromJson(Map<String, dynamic> json) =>
      PlannerAction(id: json[_idKey], name: json[_nameKey]);

  Map<String, dynamic> toJson() => {_idKey: id, _nameKey: name};
}
