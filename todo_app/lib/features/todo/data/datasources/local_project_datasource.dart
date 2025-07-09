import 'package:hive/hive.dart';

import '../models/project_model.dart';

abstract class LocalProjectDatasource {
  List<ProjectModel> getAllProjectsFromLocalDataSource();
  void addProjectToLocalDataSource(ProjectModel project);
  void updateProjectFromLocalDataSource(ProjectModel project);
  void deleteProjectFromLocalDataSource(String id);
  void deleteAllProjectsFromLocalDataSource();
}

class LocalProjectDatasourceImplementation extends LocalProjectDatasource {
  static const String projectBoxName = "Projects";
  final Box<ProjectModel> box = Hive.box<ProjectModel>(name: projectBoxName);

  @override
  List<ProjectModel> getAllProjectsFromLocalDataSource() {
    return box.getAll(box.keys).map((value) => value as ProjectModel).toList();
  }

  @override
  void addProjectToLocalDataSource(ProjectModel project) {
    box.put(project.id, project);
  }

  @override
  void deleteProjectFromLocalDataSource(String id) {
    box.delete(id);
  }

  @override
  void deleteAllProjectsFromLocalDataSource() {
    box.deleteAll(box.keys);
  }

  @override
  void updateProjectFromLocalDataSource(ProjectModel project) {
    box.put(project.id, project);
  }
}
