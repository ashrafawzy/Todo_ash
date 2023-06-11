import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_ash/presentation/selcted/selcted_cubit/todo_state.dart';
import 'package:sqflite/sqflite.dart';
import '../../../models/Listviews.dart';
import '../../new_task/new_task.dart';






// class TaskCubit extends Cubit<List<Task>> {
//   TaskCubit() : super([]);
//
//   void addTask(Task task) {
//     var currentState = state;
//     currentState.add(task);
//     emit(currentState);
//   }
//
//   void removeTask(Task task) {
//     var currentState = state;
//     currentState.remove(task);
//     emit(currentState);
//   }
// }