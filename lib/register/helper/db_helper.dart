import 'package:app_agtech_test/register/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Future<Database> openDb() async {
    final dbPath = await getDatabasesPath();

    final database = await openDatabase(
      "$dbPath-my_db.db",
    );
    return database;
  }

  void initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = "$dbPath-my_db.db";

    await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE users(
        ID INTEGER PRIMARY KEY,
        EMAIL TEXT UNIQUE,
        PASSWORD TEXT
        )
        ''');
      },
    );
  }

  Future inset(UserModel user) async {
    final dbPath = await getDatabasesPath();
    var db = await openDatabase(
      "$dbPath-my_db.db",
    );
    await db.insert("users", user.toMap());
  }

  Future getUsers() async {
    final dbPath = await getDatabasesPath();
    var db = await openDatabase(
      "$dbPath-my_db.db",
    );
    final maps = await db.query("users");
    if (maps.isNotEmpty) {
      return maps;
    }
    return null;
  }
}
