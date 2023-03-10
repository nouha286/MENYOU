import 'package:flutter/material.dart';
import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Resteau.dart';
import 'package:menyou/pages/Home.dart';
import 'package:menyou/pages/Menu_resteau.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   

    return MaterialApp(
      title: 'MenYOU',
       initialRoute: '/',
      theme: ThemeData(),
   
      routes: {
        '/':(context) => Home(),
        '/home':(context) => Home(),
        '/Menu':(context) => Menu_resteau()
      },
    );
  }
}
