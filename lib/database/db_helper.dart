import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_ash/model/Listviews.dart';


import '../bloc/todo_bloc.dart';

class DBHelper {
  static const int version = 1;
  static const String dbName = 'todo';
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnDesc = 'desc';
  static final columnDate = 'date';
  static final columnTime = 'time';
  static final columnImagePath = 'imagePath';
  static final columnIsCompleted = 'isCompleted';
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(
      path,
      onCreate: (db, version) {
        db.execute("CREATE TABLE IF NOT EXISTS todo("
            "id INTEGER PRIMARY KEY,"
            "name TEXT,"
            " desc TEXT NOT NULL,"
            "date TEXT,"
            "time TEXT,"
            "imagePath TEXT,"
            "isCompleted INTEGER DEFAULT 0 ");
      },
      version: version,
    );
  }

  static Future<List<Map<String, dynamic>>> selectAll(String tableName) async {
    final db = await DBHelper.database();
    final res = await db.query(tableName);
    res.forEach((element) {
      print(element);
    });
    return res;
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await database();
    await db.insert(
      table, // Use the table parameter
      {
        'name': data['name'],
        'desc': data['desc'],
        'date': data['date'],
        'time': data['time'],
        'imagePath': data['imagePath'],
        'isCompleted': data['isCompleted'] // Set the isCompleted field correctly
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await selectAll(dbName);
  }
  static Future<void> deleteById(String tableName, int id, List<String> whereArgs) async {
    final db = await database();
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: whereArgs,
    );
  }


  static Future deleteTable(String tableName, id) async {
    final db = await DBHelper.database();
    return db.rawQuery('DELETE FROM $tableName');
  }

  static Future update(
      String tableName,
      String columnName,
      String value,
      String id,
      ) async {
    final db = await DBHelper.database();
    return db.update(
      tableName,
      {columnName: value},
      where: 'id = ? ',
      whereArgs: [id],
    );
  }

  static initDatabase(String dbName) {}
}
Future<void> _deleteData(DeleteDataEvent event, Emitter<TodoState> emit) async {
  final id = event.id;
  try {
    await DBHelper.deleteById('todo', id as int, [id.toString()]);
    // Rest of your code
  } catch (e) {
    print('Error deleting row with id $id: $e');
    // Handle the error
  }
    // Fetch the updated list of todo items from the database
    final tasklist = await DBHelper.selectAll(DBHelper.dbName);

    // Convert the list of maps to a list of TaskModel objects
    final todoModelList = tasklist.map((e) => TaskModel.fromMap(e)).toList();

    // Emit a new state with the updated list of todo items
    emit(TodoLoadedState(todoModelList, list: [], todoItems: [], todoItemsList: []));
  }
