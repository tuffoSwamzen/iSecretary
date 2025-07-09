import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/presentation/widgets/styled_button.dart';
import 'package:todo_app/features/canban_board/presentation/bloc/bloc/canban_bloc.dart';

class CanbanStatusArrowButton extends StatelessWidget {
  final bool isChangedUp;

  const CanbanStatusArrowButton({super.key, required this.isChangedUp});

  void _onPressed(BuildContext context) {
    final bloc = context.read<CanbanBloc>();
    bloc.add(SwitchTaskModeEvent(isChangedUp: isChangedUp));
  }

  @override
  Widget build(BuildContext context) {
    final icon = isChangedUp ? Icons.arrow_upward : Icons.arrow_downward;
    return StyledButton(
      onPressed: () => _onPressed(context),
      child: Icon(icon),
    );
  }
}
