import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import 'package:todo_app/injection_container.dart';
import 'features/todo/data/models/project_model.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDataSource();
  initInjection();

  runApp(HomePage());
}

Future<void> initDataSource() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;

  Hive.registerAdapter<ProjectModel>(
    'ProjectModel',
    (dynamic json) => ProjectModel.fromJson(json),
  );
}
