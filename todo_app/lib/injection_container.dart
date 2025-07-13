import 'package:get_it/get_it.dart';
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

  // bloc
}
