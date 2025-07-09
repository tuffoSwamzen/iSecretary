import 'package:todo_app/features/todo/data/models/project_model.dart';
import 'package:todo_app/features/todo/domain/project_repository.dart';

class AddProject {
  final ProjectRepository projectRepository;

  AddProject({required this.projectRepository});

  Future<void> call(String title) async {
    projectRepository.addProject(ProjectModel(name: title));
  }
}
