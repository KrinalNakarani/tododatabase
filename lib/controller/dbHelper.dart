import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  Database? database;
  static final inte = DBHelper._();

  DBHelper._()
  {

  }


  Future<Database?> initDB() async{
    if (database != null) {
      return database;
    } else {
      return await createDB();
    }
  }

  Future<Database> createDB() async {
    Directory d1 = await getApplicationDocumentsDirectory();
    String path = join(d1.path, "abc.db");

    return openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT,note TEXT)";
      db.execute(query);
    });
  }

  void insertDB(String note) async {
    database = await initDB();
    database!.insert("todo", {"note": note});
  }

  void updateDB(String note, int id) async {
    database = await initDB();
    database!.update("todo", {"note": note}, where: "id = ${id}");
  }

  void deleteDB(int id) async {
    database = await initDB();
    database!.delete("todo", where: "id = ${id}");
  }

  Future<List<Map<String, Object?>>> readDB() async {
    database = await initDB();
    String query = "SELECT * FROM todo";

    return database!.rawQuery(query);
  }
}
