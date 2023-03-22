import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:menyou/Dto/ArticleDTO.dart';
import 'package:menyou/database/SqlDb.dart';
import 'package:menyou/models/Plat.dart';
import 'package:menyou/pages/DetailsPlat.dart';
import 'package:menyou/widgets/BottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PannierPage extends StatefulWidget {
  @override
  _PannierPageState createState() => _PannierPageState();
}

class _PannierPageState extends State<PannierPage> {
  Future<List<ArticleDTO>> getSavedPlats() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? savedPlatsString = preferences.getString("plats");
    List<ArticleDTO> savedPlats = savedPlatsString != null
        ? (jsonDecode(savedPlatsString) as List)
            .map((platJson) => ArticleDTO.fromJson(platJson))
            .toList()
        : [];
    return savedPlats;
  }

  Future<Plat> getPlat(int id) async {
    SqlDb sqlDb = SqlDb();
    final Map<String, dynamic> response =
        await sqlDb.read("SELECT * FROM Plat WHERE id=${id}");

    return Plat.fromJson(response);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pannier'),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: getSavedPlats(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ArticleDTO>> snapshot) {
          if (snapshot.hasData) {
            List<ArticleDTO> savedPlats = snapshot.data!;
            return ListView.builder(
              itemCount: savedPlats.length,
              itemBuilder: (BuildContext context, int index) {
                ArticleDTO plat = savedPlats[index];
                return FutureBuilder(
                  future: getPlat(plat.plat_id),
                  builder:
                      (BuildContext context, AsyncSnapshot<Plat> snapshot) {
                    if (snapshot.hasData) {
                      Plat platData = snapshot.data!;

                      return MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlatDetailsPage(
                                id: platData.id,
                                nom: platData.nom,
                                ingredient: platData.ingredient,
                                classification: platData.classification
                                    .toString()
                                    .split('.')
                                    .last,
                                resteau_id: platData.resteau_id,
                                prix: plat.prix,
                                image: platData.image,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                            title: Text(
                              ' ${platData.nom}',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            subtitle: Text('prix Total: ${plat.prix}'),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.redAccent,
                            ),
                            leading: MaterialButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.orange,
                              ),
                            )),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
