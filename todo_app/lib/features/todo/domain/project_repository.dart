import 'package:todo_app/features/todo/data/models/project_model.dart';

abstract class ProjectRepository {
  /// Gibt alle gespeicherten Projekte zurück
  Future<List<ProjectModel>> getProjects();

  /// Fügt ein Projekt hinzu
  Future<void> addProject(ProjectModel project);

  /// Aktualisiert ein bestehendes Projekt (noch zu implementieren)
  Future<void> updateProject(ProjectModel project);

  /// Löscht ein Projekt anhand seiner ID
  void deleteProject(String id);

  /// Löscht alle gespeicherten Projekte
  void deleteAllProjects();
}
