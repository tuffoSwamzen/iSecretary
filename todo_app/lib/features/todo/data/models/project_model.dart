import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class ProjectModel {
  static const _todosKey = 'todos';
  static const _nameKey = 'name';
  static const _idKey = 'id';
  static const _prioKey = 'prio';
  static const _dringlichkeitKey = 'dringlichkeit';
  static const _startDateKey = 'startDate';
  static const _deadlineKey = 'deadline';
  static const _isDoneKey = 'isDone';
  static const _isDoingKey = 'isDoing';
  static const _whenToCallFinishedKey = 'whenToCallFinished';

  final String id;
  final String name;
  final List<TodoModel> todos;
  final int prio;
  final int dringlichkeit;
  final DateTime? startDate;
  final DateTime? deadline;
  final bool isDone;
  final bool isDoing;
  final String whenToCallFinished;

  ProjectModel({
    required this.name,
    String? id,
    this.todos = const [],
    this.prio = 0,
    this.dringlichkeit = 0,
    this.startDate,
    this.deadline,
    this.isDone = false,
    this.isDoing = false,
    this.whenToCallFinished = '',
  }) : id = id ?? const Uuid().v1();

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json[_nameKey],
      id: json[_idKey],
      prio: json[_prioKey] ?? 0,
      dringlichkeit: json[_dringlichkeitKey] ?? 0,
      startDate:
          json[_startDateKey] != null
              ? DateTime.tryParse(json[_startDateKey])
              : null,
      deadline:
          json[_deadlineKey] != null
              ? DateTime.tryParse(json[_deadlineKey])
              : null,
      isDone: json[_isDoneKey] ?? false,
      isDoing: json[_isDoingKey] ?? false,
      whenToCallFinished: json[_whenToCallFinishedKey] ?? '',
      todos:
          (json[_todosKey] as List<dynamic>?)
              ?.map((e) => TodoModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    _idKey: id,
    _nameKey: name,
    _prioKey: prio,
    _dringlichkeitKey: dringlichkeit,
    _startDateKey: startDate?.toIso8601String(),
    _deadlineKey: deadline?.toIso8601String(),
    _isDoneKey: isDone,
    _isDoingKey: isDoing,
    _whenToCallFinishedKey: whenToCallFinished,
    _todosKey: todos.map((e) => e.toJson()).toList(),
  };
}
