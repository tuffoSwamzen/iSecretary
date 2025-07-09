import 'package:flutter/material.dart';
import 'package:todo_app/features/canban_board/presentation/widgets/canban_board_view.dart';
import 'package:todo_app/features/canban_board/presentation/widgets/canban_button_column.dart';

class CanbanBoardBody extends StatelessWidget {
  const CanbanBoardBody({super.key, required this.selectedDay});

  final DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(flex: 3, child: CanbanBoardView()),
        Expanded(flex: 1, child: CanbanButtonColumn()),
      ],
    );
  }
}
