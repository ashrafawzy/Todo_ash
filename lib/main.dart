import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_ash/models/database.dart';
import 'package:todo_ash/presentation/Splash/Splash_Screen.dart';
import 'package:todo_ash/presentation/list_mode/alltaskspage.dart';
import 'package:todo_ash/presentation/new_task/new_task.dart';
import 'package:todo_ash/presentation/new_task/new_task_cubit/add_todo_cubit.dart';
import 'package:todo_ash/presentation/shared/bloc/cubit.dart';
import 'package:todo_ash/routes/app_routes.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbManager = DatabaseManager();
  await dbManager.initDatabase();
  runApp(MyApp(databaseManager: dbManager));
}

class MyApp extends StatelessWidget {
  final DatabaseManager databaseManager;

  const MyApp({Key? key, required this.databaseManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appCubit(databaseManager as Database),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO App',
        initialRoute: AppRoutes.splashScreen,
        routes: {
          AppRoutes.splashScreen: (_) => SplashScreen(),
          AppRoutes.new_task: (_) => NewTaskPage(),
          AppRoutes.alltaskspage: (_) => AllTasksPage(),
          // other routes...
        },
      ),
    );
  }
}