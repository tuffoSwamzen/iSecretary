import 'package:flutter/material.dart';
import 'package:todo_app/features/canban_board/presentation/widgets/canban_board_body.dart';

class CanbanBodyPageView extends StatelessWidget {
  const CanbanBodyPageView({super.key, required this.selectedDay});

  final DateTime selectedDay;

  @override
  Widget build(BuildContext context) {
    return PageView(children: _getAllBoards());
  }

  List<CanbanBoardBody> _getAllBoards() {
    List<DateTime> boardList = [];
    boardList.add(selectedDay.subtract(Duration(days: 1)));
    boardList.add(selectedDay.subtract(Duration(days: 2)));
    boardList.add(selectedDay.add(Duration(days: 1)));

    return boardList.map((day) => CanbanBoardBody(selectedDay: day)).toList();
  }
}
