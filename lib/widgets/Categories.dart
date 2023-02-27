import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Resteau.dart';

class Categories extends StatelessWidget {
  final int id;
  Categories(this.id);
  @override
  Widget build(BuildContext context) {
    return Container(

      
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Container(
            height:  140.0,
           
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white,
            ),
            child: Image.asset(categories[this.id - 1].image),
          ),
          Container(
            child: Text(
              categories[this.id - 1].nom,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
