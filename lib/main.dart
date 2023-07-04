import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_ash/presentation/Splash/Splash_Screen.dart';
import 'package:todo_ash/presentation/list_mode/alltaskspage.dart';
import 'package:todo_ash/presentation/new_task/new_task.dart';
import 'package:todo_ash/presentation/selcted/selected.dart';
import 'package:todo_ash/routes/app_routes.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'bloc/todo_bloc.dart';
import 'database/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DBHelper();
  await DBHelper.database();
  runApp(MyApp(dbHelper: dbHelper));
}

class MyApp extends StatelessWidget {
  final DBHelper dbHelper;

  const MyApp({Key? key, required this.dbHelper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(dbHelper: dbHelper),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO App',
        initialRoute: AppRoutes.splashScreen,
        routes: {
          AppRoutes.splashScreen: (_) => SplashScreen(),
          AppRoutes.new_task: (_) => NewTaskPage(),
          AppRoutes.alltaskspage: (_) => AllTasksPage(),
          // AppRoutes.alltaskspage: (_) =>  SelectPage(),
          // other routes...
        },
      ),
    );
  }
}
