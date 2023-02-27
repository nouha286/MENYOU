import 'package:flutter/material.dart';
import 'package:menyou/models/Resteau.dart';

class Restaurants extends StatelessWidget {
  final int id;
  Restaurants(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(resteaux[this.id-1].image))),
        ),
        Text(resteaux[this.id-1].nom,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        Text(
          resteaux[this.id-1].description,
          style: TextStyle(color: Colors.grey),
        )
      ]),
    );
  }
}
