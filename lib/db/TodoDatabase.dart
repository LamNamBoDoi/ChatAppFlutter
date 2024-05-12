import 'package:demo/db/todo_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabase {
  static const DB_NAME = 'todo.db';
  static const DB_VERSION = 1;
  static late Database _database;

  TodoDatabase._internal();
  static final TodoDatabase instance = TodoDatabase._internal();

  Database get database => _database;

  static const initScript = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TodoTable.CREATE_TABLE_QUERY];

  init() async {
    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        onCreate: ((db, version) {
      initScript.forEach((script) async {
        await db.execute(script);
      });
    }), onUpgrade: (db, oldVersion, newVersion) {
      migrationScripts.forEach((element) async {
        await db.execute(element);
      });
    }, version: DB_VERSION);
  }
}
