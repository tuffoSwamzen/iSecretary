import 'package:todo_app/features/todo/domain/project_repository.dart';
import '../datasources/local_project_datasource.dart';
import '../models/project_model.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  final LocalProjectDatasource localTodoDatasource;

  ProjectRepositoryImpl({required this.localTodoDatasource});

  @override
  Future<List<ProjectModel>> getProjects() async {
    return localTodoDatasource.getAllProjectsFromLocalDataSource();
  }

  Future<List<ProjectModel>> getDummyProjectModelList() async {
    return <ProjectModel>[ProjectModel(name: "DummyList")];
  }

  @override
  Future<void> addProject(ProjectModel project) async {
    localTodoDatasource.addProjectToLocalDataSource(project);
  }

  @override
  Future<void> updateProject(ProjectModel project) async {
    localTodoDatasource.updateProjectFromLocalDataSource(project);
  }

  @override
  void deleteProject(String id) {
    localTodoDatasource.deleteProjectFromLocalDataSource(id);
  }

  @override
  void deleteAllProjects() {
    localTodoDatasource.deleteAllProjectsFromLocalDataSource();
  }
}
