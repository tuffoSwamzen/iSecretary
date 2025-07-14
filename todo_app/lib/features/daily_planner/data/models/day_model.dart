import 'package:todo_app/features/daily_planner/data/models/day_bloc.dart';
import 'package:uuid/uuid.dart';

class DayModel {
  static const _idKey = 'id';
  static const _blocksKey = 'timeBlocks';

  final String id;
  final List<DayBloc> timeBlocks;

  DayModel({List<DayBloc>? timeBlocks, String? id})
    : timeBlocks = timeBlocks ?? [],
      id = id ?? const Uuid().v1();

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
    id: json[_idKey],
    timeBlocks:
        (json[_blocksKey] as List<dynamic>?)
            ?.map((e) => DayBloc.fromJson(e))
            .toList() ??
        [],
  );

  Map<String, dynamic> toJson() => {
    _idKey: id,
    _blocksKey: timeBlocks.map((e) => e.toJson()).toList(),
  };
}
