import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:slicing_ui/data/model/TaskModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final String _databaseName = 'my_db.db';
  final int _databaseVersion = 1;

  final String tableDB = 'task';
  final String id = 'id';
  final String title = 'title';
  final String desc = 'desc';
  final String category = 'category';
  final String limit = 'limit';
  final String created_at = 'created_at';
  final String update_at = 'update_at';

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableDB ($id INTEGER PRIMARY KEY, $title TEXT, $desc TEXT, `$limit` TEXT NULL, $category TEXT NULL, $created_at TEXT, $update_at TEXT )');
  }

  Future<List<TaskModel>> all() async {
    final data = await _database!.query(tableDB);
    List<TaskModel> result = data.map((e) => TaskModel.fromJson(e)).toList();
    print('ini adalah result $result');

    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(tableDB, row);
    return query;
  }
}
