import 'package:todo_app/features/canban_board/domain/entities/canban_project_entity.dart';
import 'package:todo_app/features/todo/domain/project_repository.dart';

class GetAllCanBanProjectEntities {
  final ProjectRepository projectRepository;

  GetAllCanBanProjectEntities({required this.projectRepository});

  Future<List<CanbanProjectEntity>> call() async {
    final projectModels = await projectRepository.getProjects();

    return projectModels
        .map((model) => CanbanProjectEntity.fromModel(model))
        .toList();
  }
}
