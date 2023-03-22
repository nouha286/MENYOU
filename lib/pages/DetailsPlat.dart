import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menyou/Dto/ArticleDTO.dart';
import 'package:menyou/main.dart';
import 'package:menyou/models/ArticleDeCommande.dart';
import 'package:menyou/models/Classification.dart';
import 'package:menyou/models/Commande.dart';
import 'package:menyou/models/Plat.dart';
import 'package:menyou/widgets/BottomNavigation.dart';
import 'package:menyou/widgets/TextBadge.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlatDetailsPage extends StatefulWidget {
  int id;
  String nom;
  String ingredient;
  String classification;
  int resteau_id;
  double prix;
  String image;

  PlatDetailsPage(
      {required this.id,
      required this.nom,
      required this.ingredient,
      required this.classification,
      required this.resteau_id,
      required this.prix,
      required this.image});

  @override
  _PlatDetailsPageState createState() => _PlatDetailsPageState();
}

class _PlatDetailsPageState extends State<PlatDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  int quantite = 0;

  //Commande commandeActuelle = Commande(1, 0.0, DateTime.now(), [], 'No');

  Future<void> savePref(ArticleDTO articleDTO) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String savedPlatsString =
        preferences.getString("plats") ?? "[]"; // default to empty list
    List<ArticleDTO> savedPlats = (jsonDecode(savedPlatsString) as List)
        .map((platJson) => ArticleDTO.fromJson(platJson))
        .toList();
    savedPlats.add(articleDTO);
    savedPlatsString = jsonEncode(savedPlats);
    preferences.setString("plats", savedPlatsString);
    print('added $savedPlatsString');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du plat'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 120, bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:
                        TextBadge(text: '$quantite plats', color: Colors.red),
                  ),
                ],
              ),
              Image.asset(
                widget.image,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nom,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.ingredient,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: 8),
                    TextBadge(
                      text:
                          '${widget.classification.toString().split('.').last}',
                      color: Colors.yellow.shade900,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${widget.prix}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantite++;
                            });
                          },
                          icon: Icon(Icons.exposure_plus_1_outlined),
                          color: Colors.red,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (quantite > 0) {
                              QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.confirm,
                                  title:
                                      'Vous voulez vraiment ajouter ou pannier!',
                                  confirmBtnText: 'Yes',
                                  cancelBtnText: 'No',
                                  confirmBtnColor: Colors.redAccent,
                                  barrierColor: Colors.redAccent,
                                  onConfirmBtnTap: () {
                                    double prixtotale = widget.prix * quantite;

                                    savePref(ArticleDTO(
                                      1,
                                      widget.id,
                                      quantite,
                                      prixtotale,
                                    ));
                                    Navigator.pushNamed(context, '/Home');
                                  });
                            } else {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: 'Oops...',
                                text:
                                    'Merci de choisir la quantité que vous voulez avant d ajouter ou panier',
                              );
                            }
                          },
                          icon: Icon(Icons.shopping_cart),
                          label: Text('Acheter'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantite > 0) {
                                quantite--;
                              }
                            });
                          },
                          icon: Icon(Icons.exposure_minus_1_outlined),
                          color: Colors.red,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Panier');
                          },
                          icon: Icon(Icons.favorite_border),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
