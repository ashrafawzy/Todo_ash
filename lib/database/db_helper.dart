import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_ash/model/Listviews.dart';


import '../bloc/todo_bloc.dart';

class DBHelper {
  static const int version = 1;
  static const String dbName = 'todo';

  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(
      path,
      onCreate: (db, version) {
        db.execute("CREATE TABLE IF NOT EXISTS todo("
            "id INTEGER PRIMARY KEY,"
            "name TEXT,"
            "desc TEXT,"
            "date TEXT,"
            "time TEXT,"
            "imagePath TEXT)");
      },
      version: version,
    );
  }

  static Future<List<Map<String, dynamic>>> selectAll(String dbName) async {
    final db = await DBHelper.database();
 final res= await  db.query(dbName);
 res.forEach((element) {
   print(element);
 });
    return res;
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await database();
    await db.insert(
      'todo', // Use the dbName constant
      {
        'name': data['name'],
        'desc': data['desc'],
        'date': data['date'],
        'time': data['time'],
        'imagePath': data['imagePath'],
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await selectAll(dbName);
  }

  static Future deleteById(
      String tableName,
      String columnName,
      String id,
      ) async {
    final db = await DBHelper.database();
    return db.delete(
      tableName,
      where: '$columnName = ?',
      whereArgs: [id],
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
}
Future<void> _deleteData(
    DeleteDataEvent event, Emitter<TodoState> emit) async {
  final id = event.id;

  if (id != null) {
    await DBHelper.deleteById(
      DBHelper.dbName,
      'id',
      id.toString(),
    );

    // Fetch the updated list of todo items from the database
    final tasklist = await DBHelper.selectAll(DBHelper.dbName);

    // Convert the list of maps to a list of TodoModel objects
    final todoModelList =
    tasklist.map((e) =>TaskModel.fromMap(e));

    // Emit a new state with the updated list of todo items

  }
}