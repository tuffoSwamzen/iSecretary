import 'package:todo_app/features/todo/domain/project_repository.dart';

class DeleteAllProjects {
  final ProjectRepository projectRepository;
  DeleteAllProjects({required this.projectRepository});

  void call() async {
    projectRepository.deleteAllProjects();
  }
}
