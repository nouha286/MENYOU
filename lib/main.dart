import 'package:flutter/material.dart';
import 'package:menyou/database/SqlDb.dart';
import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Plat.dart';
import 'package:menyou/models/Resteau.dart';
import 'package:menyou/pages/DetailsPlat.dart';
import 'package:menyou/pages/Favoris.dart';
import 'package:menyou/pages/Home.dart';
import 'package:menyou/pages/Menu_resteau.dart';
import 'package:menyou/pages/Test.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MenYOU',
      initialRoute: '/',
      theme: ThemeData(),
      routes: {
        '/': (context) => Home(),
        '/Home': (context) => Home(),
        //'/FoodDetailsPage': (context) => PlatDetailsPage(),
        '/Test': (context) => Test(),
        '/Favoris': (context) => FavoritePlatsPage(['test', 'test']),
      },
    );
  }

  Future<List<Plat>> getPlat() async {
    final List<Map<String, dynamic>> response =
        await sqlDb.readData("SELECT * FROM Plat WHERE resteau_id=1");

    return response.map((response) => Plat.fromJson(response)).toList();
  }

  SqlDb sqlDb = SqlDb();

  void init() async {
    await sqlDb.delete();
    await sqlDb.addData();
    dynamic t = await getPlat();
    print('hi$t');
  }
}
