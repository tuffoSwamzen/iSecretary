import 'package:todo_app/features/canban_board/domain/entities/canban_project_entity.dart';

abstract class CanbanBoardRepository {
  Future<List<CanbanProjectEntity>> getAllProjects();
}
