import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_ash/bloc/todo_bloc.dart';
import 'package:todo_ash/bloc/todo_bloc.dart';
import 'package:todo_ash/components/components.dart';
import 'package:todo_ash/model/Listviews.dart';
import 'package:todo_ash/model/Listviews.dart';

import 'package:todo_ash/model/todo_model.dart';
import 'package:uuid/uuid.dart';

import '../database/db_helper.dart';
import '../model/Listviews.dart';
import 'todo_bloc.dart';
import 'todo_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';


class AddTodoItemEvent extends TodoEvent {




  @override
  List<Object?> get props => [TaskModel];
}
@override

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required DBHelper dbHelper})
      : super(TodoState(taskList: [])) {
    on<ShowDataEvent>(showData);
    on<AddDataEvent>(addTodoItem);
    // on<UpdateDataEvent>(TodoEvent as EventHandler<UpdateDataEvent, TodoState>);
    // on<DeleteDataEvent>(_deleteData);
    // on<DeleteSelectedDataEvent>(
    //     DeleteDataEvent as EventHandler<DeleteSelectedDataEvent, TodoState>);
  }

  static TodoBloc get(BuildContext context) =>
      BlocProvider.of<TodoBloc>(context);

  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is ShowDataEvent) {
      yield* _mapShowDataEventToState(event);
    } else if (event is AddDataEvent) {
      yield* _mapAddDataEventToState(event as ShowDataEvent);
    } else if (event is UpdateDataEvent) {
      yield* _mapUpdateDataEventToState(event as ShowDataEvent);
    } else if (event is DeleteDataEvent) {
      yield* _mapDeleteDataEventToState(event as ShowDataEvent);}
    // } else if (event is DeleteSelectedDataEvent) {
    //   yield* _mapDeleteSelectedDataEventToState(event as ShowDataEvent);
    // }
  }

  Stream<TodoState> _mapShowDataEventToState(ShowDataEvent event) async* {
    final TaskModel = await DBHelper.selectAll(DBHelper.dbName);

    final Task =
    (TaskModel.map((e) => null)).toList();
  }

  Stream<TodoState> _mapAddDataEventToState(ShowDataEvent event) async* {
    final TaskModel = await DBHelper.selectAll(DBHelper.dbName);

    final Task =
    (TaskModel.map((e) => null)).toList();
  }

  Stream<TodoState> _mapUpdateDataEventToState(ShowDataEvent event) async* {
    final TaskModel = await DBHelper.selectAll(DBHelper.dbName);

    final Task =
    (TaskModel.map((e) => null)).toList();
  }

  Stream<TodoState> _mapDeleteDataEventToState(ShowDataEvent event) async* {
    final TaskModel = await DBHelper.selectAll(DBHelper.dbName);

    final Task =
    (TaskModel.map((e) => null)).toList();
  }

  Stream<TodoState> _mapDeleteSelectedDataEventToState(
      ShowDataEvent event) async* {
    final TaskModel = await DBHelper.selectAll(DBHelper.dbName);

    final Task =
    (TaskModel.map((e) => null)).toList();
  }

  Future<void> showData(ShowDataEvent event, Emitter<TodoState> emit) async {
    final dataList = await DBHelper.selectAll(DBHelper.dbName);
    print('SHOW DATA Start');

    final list = dataList
        .map((item) =>
        TaskModel(
          id: item['id'],
          name: item['name'],
          desc: item['description'],
          date: item['date'],
          time: item['time'],
          imagePath: item['imagePath'],

        ))
        .toList();
    print('SHOW DATA ${list.length}');
  }

  // Future<void> _deleteSelectedData(Emitter<TodoState> emit) async {
  //   await DBHelper.deleteSelected(DBHelper.dbName,DBHelper.dbName,is);
  //
  //   // Fetch the updated list of todo items from the database
  //   final todoList = await DBHelper.selectAll(DBHelper.dbName);
  //
  //   // Convert the list of maps to a list of todoItems objects
  //   final todoItemsList =
  //   todoList.map((e) => todoItems.fromMap(e)).toList();
  //
  //   // Emit a new state with the updated list of todo items
  //   emit(TodoLoadedState(items: todoItemsList, todoItems: []));
  // }
  FutureOr<dynamic> addTodoItem(AddDataEvent event,
      Emitter<TodoState> emit) async {
    final TaskModel = event.TaskModel;

    await DBHelper.insert(DBHelper.dbName, {
      'name': TaskModel.name,
      'description': TaskModel.desc,
      'date': TaskModel.date,
      'time': TaskModel.time,
      'imagePath': TaskModel.imagePath,
    });

    // Fetch the updated list of todo items from the database
    //   final todoList = await DBHelper.selectAll(DBHelper.dbName);
    //
    //   // Convert the list of maps to a list of todoItems objects
    //   final todoItemsList =
    //   todoList.map((e) => todoItems.fromMap(e)).toList();
    //
    //   // Emit a new state with the updated list of todo items
    //   emit(TodoLoadedState(todoItems: todoItemsList, items: []));
    // }

    Future<void> _deleteData(DeleteDataEvent event,
        Emitter<TodoState> emit) async {
      final id = event.id;

      if (id != null) {
        await DBHelper.deleteTable(DBHelper.dbName, id);

        // Fetch the updated list of todo items from the database
        final TaskModel = await DBHelper.selectAll(DBHelper.dbName);

        final Task =
        (TaskModel.map((e) => null)).toList();

        // Emit a new state with the updated list of todo items

      }
    }
  }
}