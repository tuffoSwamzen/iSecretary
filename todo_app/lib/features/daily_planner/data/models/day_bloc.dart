import 'package:todo_app/features/daily_planner/data/models/planner_action.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';

class DayBloc {
  static const _startKey = 'start';
  static const _endKey = 'end';
  static const _todosKey = 'todos';
  static const _actionsKey = 'actions';
  static const _notesKey = 'notes';

  final DateTime start;
  final DateTime end;
  final List<TodoModel> todos;
  final List<PlannerAction> actions;
  final List<String> notes;

  DayBloc({
    required this.start,
    required this.end,
    this.todos = const [],
    this.actions = const [],
    this.notes = const [],
  });

  factory DayBloc.fromJson(Map<String, dynamic> json) => DayBloc(
    start: DateTime.parse(json[_startKey]),
    end: DateTime.parse(json[_endKey]),
    todos:
        (json[_todosKey] as List<dynamic>?)
            ?.map((e) => TodoModel.fromJson(e))
            .toList() ??
        [],
    actions:
        (json[_actionsKey] as List<dynamic>?)
            ?.map((e) => PlannerAction.fromJson(e))
            .toList() ??
        [],
    notes:
        (json[_notesKey] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [],
  );

  Map<String, dynamic> toJson() => {
    _startKey: start.toIso8601String(),
    _endKey: end.toIso8601String(),
    _todosKey: todos.map((e) => e.toJson()).toList(),
    _actionsKey: actions.map((e) => e.toJson()).toList(),
    _notesKey: notes,
  };
}
