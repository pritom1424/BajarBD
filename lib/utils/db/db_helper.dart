import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static const String _dbName = 'szaman_ecom.db';
  static const String carttableName = "carts";
  static const String wishlisttablename = "wishlist";
  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _dbName);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $carttableName (id INTEGER PRIMARY KEY, title TEXT, price TEXT, amount TEXT, total TEXT, imageLink TEXT)');
      await db.execute(
          'CREATE TABLE $wishlisttablename (id INTEGER PRIMARY KEY, title TEXT, unit_price TEXT, discount_price TEXT,discount Text,isShowBadge INTEGER, imageLink TEXT)');
    });
  }

  Future<int> insert(String tbleName, Map<String, dynamic> data) async {
    final client = await db;
    try {
      return await client.insert(
        tbleName,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (err) {
      rethrow;
    }
  }

  Future<void> updateTable(
      String tbleName, Map<String, dynamic> data, int id) async {
    var client = await db;
    await client.update(tbleName, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteData(String tableName, int id) async {
    final client = await db;
    try {
      return await client.delete(tableName, where: 'id = ?', whereArgs: [id]);
    } catch (err) {
      rethrow;
    }
  }

  Future<List<Map<String, Object?>>> getData(String tableName) async {
    final client = await db;
    return client.query(tableName);
  }
}
