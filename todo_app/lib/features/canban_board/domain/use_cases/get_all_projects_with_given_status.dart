import 'package:todo_app/features/canban_board/domain/entities/canban_project_entity.dart';
import 'package:todo_app/features/canban_board/domain/entities/canban_status_enum.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/get_all_canban_project_entities.dart';

class GetAllProjectsWithGivenStatus {
  final GetAllCanBanProjectEntities getAllProjects;

  GetAllProjectsWithGivenStatus({required this.getAllProjects});

  Future<List<CanbanProjectEntity>> call(CanbanStatusEnum status) async {
    final projectList = await getAllProjects();
    return projectList.where((element) {
      final a = element.canbanStatusEnum == status;
      return a;
    }).toList();
  }
}
