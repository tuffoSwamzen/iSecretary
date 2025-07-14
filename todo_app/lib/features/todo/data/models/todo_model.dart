import 'package:uuid/uuid.dart';

class TodoModel {
  static const _idKey = 'id';
  static const _titleKey = 'title';
  static const _durationKey = 'durationMinutes';
  static const _prioKey = 'prio';
  static const _dringlichkeitKey = 'dringlichkeit';
  static const _isDoneKey = 'isDone';

  final String id;
  final String title;
  final Duration duration;
  final int prio;
  final int dringlichkeit;
  final bool isDone;

  TodoModel({
    required this.title,
    required this.duration,
    this.prio = 0,
    this.dringlichkeit = 0,
    this.isDone = false,
    String? id,
  }) : id = id ?? const Uuid().v1();

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json[_idKey],
      title: json[_titleKey],
      duration: Duration(minutes: json[_durationKey] ?? 0),
      prio: json[_prioKey] ?? 0,
      dringlichkeit: json[_dringlichkeitKey] ?? 0,
      isDone: json[_isDoneKey] ?? false,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    _idKey: id,
    _titleKey: title,
    _durationKey: duration.inMinutes,
    _prioKey: prio,
    _dringlichkeitKey: dringlichkeit,
    _isDoneKey: isDone,
  };
}
