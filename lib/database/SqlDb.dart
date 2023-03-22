import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Classification.dart';

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
    String path = join(databasepath, 'test5.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE "Categorie" (
   id INTEGER  PRIMARY KEY,
   nom TEXT,
   image TEXT
  )''');

    await db.execute('''CREATE TABLE "Resteau" (
   id INTEGER  PRIMARY KEY,
   category_id INTEGER,
   adresse TEXT,
   ville TEXT,
   nom TEXT,
   description TEXT,
   image TEXT,
  
  FOREIGN KEY (category_id) REFERENCES Categorie(id)
  )''');

    await db.execute('''CREATE TABLE "Plat" (
   id INTEGER  PRIMARY KEY,
   classification TEXT,
   nom TEXT,
   ingredient TEXT,
   image TEXT,
   resteau_id INTEGER,
   prix REAL,
  
  FOREIGN KEY (resteau_id) REFERENCES Resteau(id)
  )''');

//  await db.execute('''CREATE TABLE "Commande" (
//    id INTEGER  PRIMARY KEY,
//    dateCreation TEXT,
//    prixTotal REAL,
//   )''');

    print('create succesfuly');
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);

    return response;
  }

  Future<Map<String, dynamic>> read(String sql) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> result = await mydb!.rawQuery(sql);
    if (result.isEmpty) {
      throw Exception("No data found");
    }
    return result.first;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  delete() async {
    Database? mydb = await db;
    await mydb!.rawQuery("DELETE FROM Resteau");
    await mydb.rawQuery("DELETE FROM Categorie");
    await mydb.rawQuery("DELETE FROM Plat");
  }

  // insert(Commande commande) async {
  //   Database? mydb = await db;
  //   return await mydb?.insert('Commande', commande.toMap());
  // }

  addData() async {
    Database? mydb = await db;

    await this.insertData(
        ''' INSERT INTO Categorie ( nom, image) VALUES ( 'plats asiatiques', 'images/assiatic.png'); ''');
    await this.insertData(
        ''' INSERT INTO Categorie ( nom, image) VALUES ( 'plats traditionnels', 'images/trad.png'); ''');
    await this.insertData(
        ''' INSERT INTO Categorie ( nom, image) VALUES ( 'fast food', 'images/pizza.png'); ''');

//***************************************************************************************/

    await this.insertData(
        ''' INSERT INTO Resteau ( adresse, ville, nom, description, image, category_id) VALUES ( 'Guiliz', 'Marrakech', 'McDonalds', 'Restaurant fast food', 'images/mcdo.jpg',3); ''');
    await this.insertData(
        ''' INSERT INTO Resteau ( adresse, ville, nom, description, image, category_id) VALUES ( 'Salam', 'Agadir', 'Traditions', 'Restaurant des plats marocains traditionnels', 'images/maroc.jpg',2); ''');
    await this.insertData(
        ''' INSERT INTO Resteau ( adresse, ville, nom, description, image, category_id) VALUES ( 'SQala', 'Essaouira', 'sushia', 'Restaurant des plats asiatiques', 'images/sushia.jpg',1); ''');
//*************************************************************************************/

    await this.insertData(
        '''INSERT INTO Plat (classification, nom, ingredient, image, resteau_id, prix)
VALUES ('${Classification.Entree}', 'Salade Cesar', 'Laitue romaine, croûtons, poulet grillé, sauce Cesar', 'images/sal.jpg', 1, 100.0);
''');

    await this.insertData(
        '''INSERT INTO Plat (classification, nom, ingredient, image, resteau_id, prix)
VALUES ('${Classification.Plat_Principal}', 'Seffa', 'Laitue romaine, croûtons, poulet grillé, sauce Cesar', 'images/seffa.jpg', 2, 300.0);
''');

    await this.insertData(
        '''INSERT INTO Plat (classification, nom, ingredient, image, resteau_id, prix)
VALUES ('${Classification.Plat_Principal}', 'Kouskous', 'Laitue romaine, croûtons, poulet grillé, sauce Cesar', 'images/Kouskous.jpg', 2, 100.0);
''');
    await this.insertData(
        '''INSERT INTO Plat (classification, nom, ingredient, image, resteau_id, prix)
VALUES ('${Classification.Plat_Principal}', 'Humberguer', 'Laitue romaine, croûtons, poulet grillé, sauce Cesar', 'images/hum.jpg', 1, 100.0);
''');
    await this.insertData(
        '''INSERT INTO Plat (classification, nom, ingredient, image, resteau_id, prix)
VALUES ('${Classification.Entree}', 'Salade Cesar', 'Laitue romaine, croûtons, poulet grillé, sauce Cesar', 'images/sal.jpg', 1, 100.0);
''');
    print("added succefuly");
  }
}
