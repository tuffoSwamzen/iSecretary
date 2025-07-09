import 'package:get_it/get_it.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/add_project.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/delete_all_projects.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/get_all_canban_project_entities.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/get_all_projects_with_given_status.dart';
import 'package:todo_app/features/canban_board/domain/use_cases/switch_status_of_canban_entity.dart';
import 'package:todo_app/features/canban_board/presentation/bloc/bloc/canban_bloc.dart';
import 'package:todo_app/features/todo/data/repositories/project_repository_implementation.dart';
import 'package:todo_app/features/todo/domain/project_repository.dart';

import 'features/todo/data/datasources/local_project_datasource.dart';

var sl = GetIt.instance;
void initInjection() {
  //data
  sl.registerLazySingleton<LocalProjectDatasource>(
    () => LocalProjectDatasourceImplementation(),
  );
  //repo
  sl.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(localTodoDatasource: sl()),
  );
  // usecase
  sl.registerLazySingleton(
    () => GetAllCanBanProjectEntities(projectRepository: sl()),
  );
  sl.registerLazySingleton(
    () => GetAllProjectsWithGivenStatus(getAllProjects: sl()),
  );
  sl.registerLazySingleton(() => AddProject(projectRepository: sl()));
  sl.registerLazySingleton(
    () => SwitchStatusOfCanbanEntity(projectRepository: sl()),
  );
  sl.registerLazySingleton(() => DeleteAllProjects(projectRepository: sl()));

  // bloc
  sl.registerFactory(
    () => CanbanBloc(
      getAllProjects: sl(),
      getAllProjectsWithGivenStatus: sl(),
      addProject: sl(),
      switchStatusOfCanbanEntity: sl(),
      deleteAllProjects: sl(),
    ),
  );
}
