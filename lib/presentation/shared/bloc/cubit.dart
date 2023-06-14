import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:todo_ash/presentation/shared/bloc/states.dart';

import '../../../models/database.dart';
import '../../../modules/ArchivedTasks/ArchivedTasks.dart';
import '../../../modules/DoneTasks/DoneTasks.dart';
import '../../../modules/NewTasks/NewTasks.dart';
import '../../new_task/new_task.dart';

 class appCubit extends Cubit<States> {
  appCubit(Database db) : super(InitialState());

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
  Future<void> InsertTask(String ImagePath, String name, String description, String date, String time, String status,
      {required String Image,
    required String Name, required String Descraption, required String Date, required String Time, required String imagePath}) async {
    try {
      await DatabaseManager().initDatabase();
      await DatabaseManager().insertTask(ImagePath, name, description, date, time, status);
      emit(InsertNewTaskSuccessState());
    } catch (error) {
      emit(InsertNewTaskErrorState());
    }
  }
  Future<void> updateTask(int id, String image, String name, String description, String date, String time) async {
    try {
      await DatabaseManager().initDatabase();
      await DatabaseManager().updateTask(id, image, name, description, date, time);
      emit(UpdateTaskSuccessState());
    } catch (error) {
      emit(UpdateTaskErrorState());
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await DatabaseManager().initDatabase();
      await DatabaseManager().deleteTask(id);
      emit(DeleteTaskSuccessState());
    } catch (error) {
      emit(DeleteTaskErrorState());
    }
  }

}


