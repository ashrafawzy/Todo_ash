import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';


import '../../../models/Listviews.dart';
import '../../selcted/selcted_cubit/todo_cubit.dart';
import '../new_task.dart';

part 'add_todo_state.dart';
class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState(taskModel: TaskModel(taskList: [])));

  void addTask(Task task) =>
      emit(TaskState(
          taskModel: TaskModel(taskList: [...state.taskModel.taskList, task])));

  void removeTask(int index) {
    var task = state.taskModel.taskList[index];
    var updatedList = [...state.taskModel.taskList];
    final newState = state.copyWith(
        taskModel: TaskModel(taskList: updatedList..remove(task)));
    emit(newState);
  }
  void toggleTaskStatus(int index) {
    var updatedList = state.taskModel.taskList;
    updatedList[index].toggleTask();
    final newState =
    state.copyWith(taskModel: TaskModel(taskList: updatedList));
    emit(newState);
  }
}
