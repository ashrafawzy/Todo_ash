import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  late Database _database;

  Future<void> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'todo.db');
    _database = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, description TEXT, date TEXT, time TEXT, image TEXT)');
    });
  }

  Database get database {
    if (!_database.isOpen) {
      throw Exception('Database has not been initialized.');
    }
    return _database;
  }
}


Future<List<Map<String, dynamic>>> getTasks(Database db, String status) async {
    final List<Map<String, dynamic>> tasks = await db.query(
      'Tasks',
      where: 'status = ?',
      whereArgs: [status],
    );
    return tasks;
  }

Future<void> insertTask(Database db, String? name, String? description, String? date, String? time,String? imagePath, String? status) async {
  await db.insert(
    'Tasks',
    {
      'name': name,
      'description': description,
      'date': date,
      'time': time,
      'image': imagePath,
      'status': status,
    },
  );
}

Future<void> updateTask(Database db, int id, String imagePath, String name, String description, String date, String time) async {
    await db.update(
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

  Future<void> deleteTask(Database db,int id) async {
    await db.delete(
      'Tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
