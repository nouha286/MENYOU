import 'package:flutter/material.dart';
import 'package:menyou/database/SqlDb.dart';
import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Resteau.dart';
import 'package:menyou/pages/DetailsPlat.dart';
import 'package:menyou/pages/Home.dart';
import 'package:menyou/pages/Menu_resteau.dart';

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
        '/FoodDetailsPage': (context) => FoodDetailsPage(),
        // '/Menu': (context) => Menu_resteau()
      },
    );
  }

  SqlDb sqlDb = SqlDb();

  void init() async {
    await sqlDb.delete();
    await sqlDb.addData();
  }
}
