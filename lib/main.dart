import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_ash/presentation/Splash/Splash_Screen.dart';
import 'package:todo_ash/presentation/list_mode/list_mode.dart';
import 'package:todo_ash/presentation/new_task/new_task.dart';
import 'package:todo_ash/presentation/new_task/new_task_cubit/add_todo_cubit.dart';
import 'package:todo_ash/presentation/shared/bloc/cubit.dart';
import 'package:todo_ash/routes/app_routes.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provide an instance of the TaskCubit

    return BlocProvider(
      create: (context) => appCubit(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO App',
        initialRoute: AppRoutes.splashScreen,
        routes: {
          AppRoutes.splashScreen: (_) => SplashScreen(),
          AppRoutes.new_task: (_) => NewTaskPage(),
          // other routes...
        },

      ),
    );
  }
}


