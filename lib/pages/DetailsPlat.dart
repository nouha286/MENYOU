import 'package:flutter/material.dart';
import 'package:menyou/models/Classification.dart';
import 'package:menyou/widgets/BottomNavigation.dart';
import 'package:menyou/widgets/TextBadge.dart';

class PlatDetailsPage extends StatefulWidget {
  final int id;
  final String nom;
  final String ingredient;
  final String classification;
  final int resteau_id;
  final double prix;
  final String image;

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
  int quantite = 0;

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
                    SizedBox(height: 8),
                    Text(
                      'Restaurant ID: ${widget.resteau_id}',
                      style: Theme.of(context).textTheme.bodyText2,
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
                            Navigator.pushNamed(context, '/Favoris');
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
                              quantite--;
                            });
                          },
                          icon: Icon(Icons.exposure_minus_1_outlined),
                          color: Colors.red,
                        ),
                        IconButton(
                          onPressed: () {},
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
