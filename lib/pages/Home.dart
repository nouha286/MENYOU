import 'package:flutter/material.dart';
import 'package:menyou/database/SqlDb.dart';
import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Resteau.dart';
import 'package:menyou/pages/Menu_resteau.dart';
import 'package:menyou/widgets/BottomNavigation.dart';
import 'package:menyou/widgets/Categories.dart';
import 'package:menyou/widgets/Restaurants.dart';
import 'package:menyou/widgets/Search.dart';
import 'package:menyou/widgets/Select.dart';
import 'package:menyou/widgets/appBar.dart';
import 'package:menyou/widgets/sideBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedVille = 'Tout';
  SqlDb sqlDb = SqlDb();

  Future<List<String>> readData() async {
    List<Map> villes =
        await sqlDb.readData("SELECT DISTINCT ville FROM Resteau");

    final List<Map<dynamic, dynamic>> list = villes;
    final List<String> stringList =
        list.map((map) => map['ville'].toString()).toList();
    stringList.add('Tout');
    return stringList;
  }

  Future<List<Resteau>> getResteau(String ville) async {
    List<Map<String, dynamic>> resteaux =
        await sqlDb.readData("SELECT *  FROM Resteau");
    if (ville != 'Tout') {
      resteaux =
          await sqlDb.readData("SELECT *  FROM Resteau WHERE ville='$ville'");
    }

    return resteaux.map((resteaux) => Resteau.fromJson(resteaux)).toList();
  }

  Future<List<Map>> getCategories() async {
    List<Map> categories = await sqlDb.readData("SELECT *  FROM Categorie");

    return categories;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> KeyDrawer = GlobalKey();

    return Scaffold(
      key: KeyDrawer,
      endDrawer: sideBar(),
      body: Column(
        children: [
          appbar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: InputSelect(
              hintText: 'Sélectionner une ville',
              options: readData(),
              onChanged: (String newValue) {
                setState(() {
                  selectedVille = newValue;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(child: Search()),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      KeyDrawer.currentState?.openEndDrawer();
                    },
                    child: Icon(
                      Icons.menu_open,
                      color: Colors.amberAccent,
                      size: 50.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 160,
              ),
              child: FutureBuilder(
                  future: getCategories(),
                  builder:
                      (BuildContext ctx, AsyncSnapshot<List<Map>> snapshot) {
                    return snapshot.hasData
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, index) {
                                return MaterialButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Test');
                                  },
                                  child: Categories(
                                      image: snapshot.data![index]['image'],
                                      nom: snapshot.data![index]['nom']),
                                );
                              },
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }),
            ),
          ),
          Flexible(
            child: FutureBuilder<List<Resteau>>(
                future: getResteau(selectedVille),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              final resteauList = snapshot.data!;
                              return MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Menu_resteau(
                                          id_resteau: resteauList[index].id),
                                    ),
                                  );
                                },
                                child: Restaurants(
                                  nom: resteauList[index].nom,
                                  adresse: resteauList[index].adresse,
                                  description: resteauList[index].description,
                                  ville: resteauList[index].ville,
                                  image: resteauList[index].image,
                                  category_id: resteauList[index].categorie_id,
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
