import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text("MenYOU"),
          backgroundColor: Colors.orange[900],
        ),
        body: Center(
            child: Image(
          image: AssetImage("images/logo.png"),
        )),
      ),
    ),
  );
}
