import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/canban_board/presentation/bloc/bloc/canban_bloc.dart';
import 'package:todo_app/features/canban_board/presentation/widgets/canban_body_page_view.dart';
import 'package:todo_app/injection_container.dart';

class CanbanBoardPage extends StatefulWidget {
  const CanbanBoardPage({super.key, required this.day});
  final DateTime day;

  @override
  State<CanbanBoardPage> createState() => _CanbanBoardPageState();
}

class _CanbanBoardPageState extends State<CanbanBoardPage> {
  late final CanbanBloc canbanBloc;

  _CanbanBoardPageState();
  @override
  void initState() {
    canbanBloc = sl<CanbanBloc>();
    canbanBloc.add(InitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: canbanBloc,
      child: BlocBuilder<CanbanBloc, CanbanState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(""),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: CanbanBodyPageView(selectedDay: DateTime.now()),
          );
        },
      ),
    );
  }
}
