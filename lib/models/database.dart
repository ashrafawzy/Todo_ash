import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, imagePath TEXT, TEXT, name TEXT, description TEXT, date TEXT, time TEXT, status TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<List<Map<String, dynamic>>> getTasks(String status) async {
    final List<Map<String, dynamic>> tasks = await _database.query(
      'Tasks',
      where: 'status = ?',
      whereArgs: [status],
    );
    return tasks;
  }

  Future<void> insertTask(String? imagePath, String? name, String? description, String? date, String? time, String? status) async {
    await _database.insert(
      'Tasks',
      {
        'image': imagePath,
        'name': name,
        'description': description,
        'date': date,
        'time': time,
        'status': status,
      },
    );
  }

  Future<void> updateTask(int id, String imagePath, String name, String description, String date, String time) async {
    await _database.update(
      'Tasks',
      {
        'image': imagePath,
        'name': name,
        'description': description,
        'date': date,
        'time': time,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTask(int id) async {
    await _database.delete(
      'Tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}