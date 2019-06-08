import 'dart:async';
import 'dart:io';
import 'package:first_flutter_app/not_to_do_app/model/no_do_item.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// this class will responsible for creating database, tables and all operations.
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  /// factory word will help us not to create multi instance from the same class ...
  factory DatabaseHelper() => _instance;

  final String tableItem = "nodoTable";
  final String columnId = "id";
  final String columnItemName = "itemName";
  final String columnDateCreated = "dateCreated";

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
    String path = join(documentDirectory.path, "nodo_db.db");

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);

    return ourDb;
  }

  /*
    id | itemName | dateCreated
    -------------------------
     1 | mina samir  | 15631348358
     2 | beshoy samy | 16468516
   */

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $tableItem($columnId INTEGER PRIMARY KEY,"
        " $columnItemName TEXT, $columnDateCreated TEXT)");
  }

  // CRUD --> create read update delete ...

  //Insertion
  Future<int> saveItem(NoDoItem item) async {
    var dbClient = await db;
    int res = await dbClient.insert(tableItem, item.toMap());
    return res;
  }

  // get all users ...
  Future<List> getItems() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $tableItem ORDER BY $columnItemName ASC");
    return res.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableItem"));
  }

  Future<NoDoItem> getItem(int id) async {
    var dbClient = await db;
    var res = await dbClient
        .rawQuery("SELECT * FROM $tableItem WHERE $columnId = $id");
    if (res.length == 0) return null;
    return NoDoItem.fromMap(res.first);
  }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    var res = await dbClient
        .delete(tableItem, where: "$columnId = ?", whereArgs: [id]);
    return res;
  }

  Future<int> updateItem(NoDoItem item) async {
    var dbClient = await db;
    var res = await dbClient.update(tableItem, item.toMap(),
        where: "$columnId = ?", whereArgs: [item.id]);
    return res;
  }

  Future closeDb() async {
    return (await db).close();
  }
}
