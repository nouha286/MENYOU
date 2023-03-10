import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  _onUpgrade(Database db, int oldVersion, int newversion) {
    print("onUpgrade **********************");
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'testDb.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE "test" (
   "id" INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY,
   "adresse" TEXT;
   "ville" TEXT;
   "nom" TEXT;
   "description" TEXT;
   "categorie" TEXT;
   "image" TEXT;
  )''');

    print('create succesfuly');
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }


    insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }
}
