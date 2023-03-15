import 'package:flutter/material.dart';
import 'package:menyou/database/SqlDb.dart';
import 'package:menyou/models/Resteau.dart';
import 'package:badges/badges.dart' as badges;
import 'package:menyou/widgets/TextBadge.dart';

class Restaurants extends StatelessWidget {
  final String ville;
  final String adresse;
  final String nom;
  final String image;
  final String description;
  final int category_id;
  Restaurants(
      {required this.nom,
      required this.adresse,
      required this.description,
      required this.ville,
      required this.image,
      required this.category_id});

  SqlDb sqlDb = SqlDb();
  Future<String> getCategorie() async {
    final results = await sqlDb
        .readData("SELECT nom FROM Categorie WHERE id = ${this.category_id}");
    final rows = results.toList();
    if (rows.isEmpty) {
      return "Without category";
    }
    final row = rows.first;
    final nom = row["nom"] as String;
    return nom;
  }

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
                  fit: BoxFit.cover, image: AssetImage(this.image))),
        ),
        Text(this.nom,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        Text(
          this.description,
          style: TextStyle(color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FutureBuilder<String>(
              future: getCategorie(),
              builder: (context, snapshot) {
                return TextBadge(
                  text: snapshot.data!,
                  color: Colors.red,
                  borderRadius: 20,
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                );
              },
            ),
          ],
        )
      ]),
    );
  }
}
