import 'package:flutter/material.dart';
import 'package:todo_app/features/canban_board/domain/entities/canban_project_entity.dart';
import 'package:todo_app/features/canban_board/presentation/bloc/bloc/canban_bloc.dart';

class CanbanProjectCard extends StatelessWidget {
  final CanbanBloc canbanBloc;
  final CanbanProjectEntity projectEntity;
  const CanbanProjectCard({
    super.key,
    required this.canbanBloc,
    required this.projectEntity,
  });

  void _onTap() {
    canbanBloc.add(SelectedProjectEvent(selectedProject: projectEntity));
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = projectEntity == canbanBloc.state.selectedProject;
    return GestureDetector(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: isSelected ? Colors.amber : Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [SizedBox(height: 30, child: Text(projectEntity.title))],
          ),
        ),
      ),
    );
  }
}

//"cdfa1021-5411-11f0-bbae-d90534ed7748"
//"cf6befa0-5411-11f0-bbae-d90534ed7748"
