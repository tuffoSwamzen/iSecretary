import 'package:flutter/material.dart';
import 'package:todo_app/features/canban_board/presentation/widgets/canban_delete_all_projects_button.dart';
import 'package:todo_app/features/canban_board/presentation/widgets/canban_status_arrow_button.dart';
import 'package:todo_app/features/canban_board/presentation/widgets/to_add_project_page_button.dart';

class CanbanButtonColumn extends StatelessWidget {
  const CanbanButtonColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          CanbanStatusArrowButton(isChangedUp: true),
          CanbanStatusArrowButton(isChangedUp: false),
          ToAddProjectPageButton(),
          CanbanDeleteAllProjectsButton(),
        ],
      ),
    );
  }
}
