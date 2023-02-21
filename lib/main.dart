import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text("MenYOU"),
          backgroundColor: Colors.orange[900],
        ),
        body: SafeArea(
          child: Container(
              child: Image(
            image: AssetImage("images/logo.png")
          )),
        ),
      ),
    );
  }
}
