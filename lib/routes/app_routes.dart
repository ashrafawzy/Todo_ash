import 'package:flutter/material.dart';
import 'package:todo_ash/presentation/Splash/Splash_Screen.dart';
import 'package:flutter/material.dart';

import '../presentation/list_mode/alltaskspage.dart';
import '../presentation/new_task/new_task.dart';
import '../presentation/selcted/selected.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      initialRoute: AppRoutes.splashScreen,
      routes: {
        AppRoutes.splashScreen: (_) => SplashScreen(),
        AppRoutes.new_task: (_) => NewTaskPage(),
        AppRoutes.alltaskspage: (_) => AllTasksPage(),
        // AppRoutes. SelectPage: (_) =>  SelectPage(),
        // AppRoutes.calendar_mode: (_) => CalendarModeScreen(),
        // AppRoutes.done_tasks: (_) => DoneTasksScreen(),
        // AppRoutes.task_details: (_) => TaskDetailsScreen(),
      },
    );
  }
}

//
// import '../presentation/Doctor/doctor_page.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String new_task = '/new_task';
  static const String alltaskspage = '/alltaskspage';
  static const String  SelectPage = '/ SelectPage';
  static const String calendar_mode = '/calendar_mode';
  static const String done_tasks = '/done_tasks';
  static const String task_details = '/task_details';
  static const String initialRoute = '/initialRoute';

//   static Map<String, WidgetBuilder> get routes => {
//     splashScreen: SplashScreen.builder,
//     new_task:new_task.builder,
//     list_mode:list_mode.builder,
//     selected:selected.builder,
//     calendar_mode:calendar_mode.builder,
//     done_tasks:done_tasks.builder,
//     task_details:task_details.builder,
//     // doctorListScreen:DoctorListScreen.builder,
//   };
}
