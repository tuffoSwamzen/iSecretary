import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/canban_board/presentation/bloc/bloc/canban_bloc.dart';
import 'package:todo_app/features/canban_board/presentation/widgets/canban_container.dart';

class CanbanBoardView extends StatelessWidget {
  const CanbanBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    final canbanBloc = context.read<CanbanBloc>();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(height: 40)],
        ),
      ),
    );
  }
}
