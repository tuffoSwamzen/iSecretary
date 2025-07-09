import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/presentation/widgets/styled_button.dart';
import 'package:todo_app/features/canban_board/presentation/bloc/bloc/canban_bloc.dart';
import 'package:todo_app/features/canban_board/presentation/pages/add_project_page.dart';

class ToAddProjectPageButton extends StatelessWidget {
  const ToAddProjectPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canbanBloc = context.read<CanbanBloc>();
    return StyledButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder:
                (BuildContext context) =>
                    AddProjectPage(canbanBloc: canbanBloc),
          ),
        );
      },
    );
  }
}
