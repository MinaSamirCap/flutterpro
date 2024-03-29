import 'dart:async';
import 'dart:io';
import 'package:first_flutter_app/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// this class will responsible for creating database, tables and all operations.
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  /// factory word will help us not to create multi instance from the same class ...
  factory DatabaseHelper() => _instance;

  final String tableUser = "userTable";
  final String columnId = "id";
  final String columnUsername = "username";
  final String columnPassword = "password";

  /// database object
  static Database _db;

  /// apply singleton pattern ...
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  /// the name of internal can be anything .. we can give it any name ..
  /// the idea of this constructor it is to be private to the class ..
  DatabaseHelper.internal() {}

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "maindb.db");

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);

    return ourDb;
  }

  /*
    id | username | password
    -------------------------
     1 | mina samir  | 1358
     2 | beshoy samy | 96358
   */

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $tableUser($columnId INTEGER PRIMARY KEY,"
        " $columnUsername TEXT, $columnPassword TEXT)");
  }

  // CRUD --> create read update delete ...

  //Insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert(tableUser, user.toMap());
    return res;
  }

  // get all users ...
  Future<List> getAllUsers() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $tableUser");
    return res.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableUser"));
  }

  Future<User> getUser(int id) async {
    var dbClient = await db;
    var res = await dbClient
        .rawQuery("SELECT * FROM $tableUser WHERE $columnId = $id");
    if (res.length == 0) return null;
    return User.fromMap(res.first);
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    var res = await dbClient
        .delete(tableUser, where: "$columnId = ?", whereArgs: [id]);
    return res;
  }

  Future<int> updateUser(User user) async {
    var dbClient = await db;
    var res = await dbClient.update(tableUser, user.toMap(),
        where: "$columnId = ?", whereArgs: [user.id]);
    return res;
  }

  Future closeDb() async {
    return (await db).close();
  }
}
