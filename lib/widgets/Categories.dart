import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Resteau.dart';

class Categories extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Column(
        children: [
          Container(
            color: Colors.red.shade100,
            child: Image.asset(categories[1].image),
          ),
          Text(
            categories[1].nom,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
