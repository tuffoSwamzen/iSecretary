import 'package:flutter/material.dart';
import 'package:todo_app/features/canban_board/presentation/bloc/bloc/canban_bloc.dart';

class AddProjectPage extends StatelessWidget {
  final CanbanBloc canbanBloc;

  const AddProjectPage({super.key, required this.canbanBloc});
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("create Project")),
      body: Column(
        children: [
          Row(
            children: [
              Text("Title:"),
              SizedBox(width: 200, child: TextField(controller: controller)),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              canbanBloc.add(CreateProjectEvent(title: controller.text));
              Navigator.pop(context);
            },
            child: Text("save"),
          ),
        ],
      ),
    );
  }
}
