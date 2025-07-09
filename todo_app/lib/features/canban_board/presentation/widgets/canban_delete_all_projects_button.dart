import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/presentation/widgets/styled_button.dart';
import 'package:todo_app/features/canban_board/presentation/bloc/bloc/canban_bloc.dart';

class CanbanDeleteAllProjectsButton extends StatelessWidget {
  const CanbanDeleteAllProjectsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledButton(
      onPressed: () => context.read().add(DeleteAllProjectsEvent()),
      child: Icon(Icons.remove),
    );
  }
}
