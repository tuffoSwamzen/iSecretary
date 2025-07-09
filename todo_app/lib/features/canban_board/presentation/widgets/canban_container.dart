import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/canban_board/domain/entities/canban_project_entity.dart';
import 'package:todo_app/features/canban_board/presentation/bloc/bloc/canban_bloc.dart';
import 'package:todo_app/features/canban_board/presentation/widgets/canban_project_card.dart';

class CanbanContainer extends StatelessWidget {
  final double height;
  final Color color;
  final List<CanbanProjectEntity> projectsForContainer;

  const CanbanContainer({
    required this.height,
    required this.color,
    super.key,
    this.projectsForContainer = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(19)),
        color: color,
      ),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: projectsForContainer.length,
          itemBuilder: ((context, index) {
            return CanbanProjectCard(
              canbanBloc: context.read<CanbanBloc>(),
              projectEntity: projectsForContainer[index],
            );
          }),
        ),
      ),
    );
  }
}
