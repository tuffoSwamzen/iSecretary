import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/canban_board/presentation/bloc/bloc/canban_bloc.dart';

import '../../../../injection_container.dart';

class CanbanBlocListener extends StatefulWidget {
  const CanbanBlocListener({super.key});

  @override
  State<CanbanBlocListener> createState() => _CanbanBlocListenerState();
}

class _CanbanBlocListenerState extends State<CanbanBlocListener> {
  late final CanbanBloc canbanBloc;

  @override
  void initState() {
    // TODO: implement initState
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
          return Placeholder();
        },
      ),
    );
  }
}
