import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:todo_ash/models/Listviews.dart';
import 'package:todo_ash/presentation/shared/bloc/states.dart';

import '../../../models/database.dart';
import '../../../modules/ArchivedTasks/ArchivedTasks.dart';
import '../../../modules/DoneTasks/DoneTasks.dart';
import '../../../modules/NewTasks/NewTasks.dart';
import '../../new_task/new_task.dart';

 class appCubit extends Cubit<States> {
  appCubit(Database db) : super(InitialState());
  List<Task> _tasks = [];
  static appCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool isBottomSheetShown = false;

  late Database db;
  List<Map>NewTasks = [];
  List<Map>DoneTasks = [];
  List<Map>ArchivedTasks = [];

  List<Widget>Screens = [NewTaskPage()];
  List<String>titles = ['New tasks', 'Done tasks', 'Archived tasks'];

  void ChangeNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBar());
  }
  void insertTask(String name, String description, String date, String time, String imagePath,) {
    final newTask = Task(
      name: name,
      date: date,
      time: time,
      imagePath: imagePath,
      descraption: description,
    );
    _tasks.add(newTask);
    emit(TasksLoaded(_tasks));
  }
  Future<void> updateTask(int id, String name, String description, String date, String time, String image) async {
    try {
      await DatabaseManager().initDatabase();
      emit(UpdateTaskSuccessState());
    } catch (error) {
      emit(UpdateTaskErrorState());
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await DatabaseManager().initDatabase();

      emit(DeleteTaskSuccessState());
    } catch (error) {
      emit(DeleteTaskErrorState());
    }
  }

}


