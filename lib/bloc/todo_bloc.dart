import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_ash/components/components.dart';
import 'package:todo_ash/database/db_helper.dart';
import 'package:uuid/uuid.dart';

import '../model/Listviews.dart';
import '../model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final DBHelper dbHelper;

  TodoBloc({required this.dbHelper})
      : super(TodoState(todoItems: [])) {
    on<ShowDataEvent>(showData);
    on<AddDataEvent>(addTodoItem);
    on<DeleteSelectedEvent>((event, emit) async {
      // Perform the logic of deleting the selected tasks here
      await _deleteSelectedData(event.selectedTaskId, emit);
    });
  }

  Future<void> _deleteSelectedData(int selectedTaskId, Emitter<TodoState> emit) async {
    // Get the index of the selected task
    final selectedIndex = state.todoItems.indexWhere((item) => item.id == selectedTaskId);

    // Initialize the task object with the selected task
    final task = state.todoItems[selectedIndex];

    // Delete the selected task from the database
    await DBHelper.deleteById(
      DBHelper.dbName,
      "id = ?" as int,
      [],
    );

    // Remove the selected task from the list of todo items
    state.todoItems.removeAt(selectedIndex);

    // Fetch the updated list of todo items from the database
    final taskList = await DBHelper.selectAll(DBHelper.dbName);

    // Convert the list of maps to a list of TaskModel objects
    final todoItemsList = taskList
        .map((item) => TaskModel(
      id: item['id'],
      name: item['name'],
      desc: item['description'] ,
      date: item['date'],
      time: item['time'],
      imagePath: item['imagePath'],
      isCompleted: item['isCompleted'],
    ))
        .toList();

    // Emit a new state with the updated list of todo items
    emit(TodoState(todoItems: todoItemsList));
  }

  void showData(ShowDataEvent event, Emitter<TodoState> emit) async {
    // Fetch the list of todo items from the database
    final taskList = await DBHelper.selectAll(DBHelper.dbName);

    // Convert the list of maps to a list of TaskModel objects
    final todoItemsList = taskList
        .map((item) => TaskModel(
      id: item['id'],
      name: item['name'],
      desc: item['description'] ,
      date: item['date'],
      time: item['time'],
      imagePath: item['imagePath'],
      isCompleted: item['isCompleted'],
    ))
        .toList();

    // Emit a new state with the list of todo items
    emit(TodoState( todoItems: []));
  }

  void addTodoItem(AddDataEvent event, Emitter<TodoState> emit) async {
    // Insert the new todo item into the database
    await DBHelper.insert(DBHelper.dbName, {
      'name': event.name,
      'description': event.desc,
      'date': event.date,
      'time': event.time,
      'imagePath': event.imagePath,
      'isCompleted': event.isCompleted ? 1 : 0,
    });

    // Fetch the updated list of todo items from the database
    final taskList = await DBHelper.selectAll(DBHelper.dbName);

    // Convert the list of maps to a list of TaskModel objects
    final todoItemsList = taskList
        .map((item) => TaskModel(
      id: item['id'],
      name: item['name'],
      desc: item['description'] ,
      date: item['date'],
      time: item['time'],
      imagePath: item['imagePath'],
      isCompleted: item['isCompleted'],
    ))
        .toList();

    // Emit a new state with the updated list of todo items
    emit(TodoState(todoItems: todoItemsList));
  }
}

