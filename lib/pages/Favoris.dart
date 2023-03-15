import 'package:flutter/material.dart';
import 'package:menyou/models/Plat.dart';
import 'package:menyou/widgets/BottomNavigation.dart';

class FavoritePlatsPage extends StatefulWidget {
  final List favoritePlats;

  FavoritePlatsPage(this.favoritePlats);

  @override
  _FavoritePlatsPageState createState() => _FavoritePlatsPageState();
}

class _FavoritePlatsPageState extends State<FavoritePlatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plats préférés'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.favoritePlats.isEmpty)
                Text('Vous n\'avez pas encore ajouté de plats à vos favoris.')
              else
                ...widget.favoritePlats.map((plat) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' plat.nom',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(Icons.delete),
                            label: Text('défavoriser'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
