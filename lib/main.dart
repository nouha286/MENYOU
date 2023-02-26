import 'package:flutter/material.dart';
import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Resteau.dart';
import 'package:menyou/pages/Home.dart';

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
      theme: ThemeData(),
      home: Home(),
    );
  }
}
