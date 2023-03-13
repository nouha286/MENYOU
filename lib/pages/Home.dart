import 'package:flutter/material.dart';
import 'package:menyou/database/SqlDb.dart';
import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Resteau.dart';
import 'package:menyou/pages/Menu_resteau.dart';
import 'package:menyou/widgets/Categories.dart';
import 'package:menyou/widgets/Restaurants.dart';
import 'package:menyou/widgets/Select.dart';
import 'package:menyou/widgets/sideBar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> KeyDrawer = GlobalKey();
    SqlDb sqlDb = SqlDb();
    Future<List<String>> readData() async {
      List<Map> villes =
          await sqlDb.readData("SELECT Distinct ville FROM Resteau");

      final List<Map<dynamic, dynamic>> list = villes;
      final List<String> stringList =
          list.map((map) => map['ville'].toString()).toList();

      return stringList;
    }

    Future<List<Map>> getResteau() async {
      List<Map> restaux = await sqlDb.readData("SELECT *  FROM Resteau");

      return restaux;
    }

    Future<List<Map>> getCategories() async {
      List<Map> categories = await sqlDb.readData("SELECT *  FROM Categorie");

      return categories;
    }

    return Scaffold(
      key: KeyDrawer,
      endDrawer: sideBar(),
      body: Column(children: [
        AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
//        backgroundColor: Color(0xFF0077ED),
          elevation: 0.0,
          title: new Text("Menyou",
              style: const TextStyle(
                  color: Color.fromARGB(255, 98, 98, 98),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 19.0)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: InputSelect(
            hintText: 'Select an option',
            options: readData(),
            onChanged: (String newValue) {},
          ),
        ),
        Container(
          padding: EdgeInsets.all(15.0),
          child: Row(children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.yellowAccent),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 25,
                        color: Colors.amber.shade100)
                  ]),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search  ...',
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search))),
            )),
            SizedBox(
              width: 10.0,
            ),
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
          ]),
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: 160,
          ),
          child: FutureBuilder(
              future: getCategories(),
              builder: (BuildContext ctx, AsyncSnapshot<List<Map>> snapshot) {
                return snapshot.hasData
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              return MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/Menu');
                                },
                                child: Categories(
                                    image: snapshot.data![index]['image'],
                                    nom: snapshot.data![index]['nom']),
                              );
                            },
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
        ),
        FutureBuilder(
            future: getResteau(),
            builder: (BuildContext ctx, AsyncSnapshot<List<Map>> snapshot) {
              return snapshot.hasData
                  ? Container(
                      height: 300.0,
                      width: MediaQuery.of(context).size.width,
                      child: Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, index) {
                            return MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Menu_resteau(
                                        id_resteau: snapshot.data![index]
                                            ['id']),
                                  ),
                                );
                              },
                              child: Restaurants(
                                nom: snapshot.data![index]['nom'],
                                adresse: snapshot.data![index]['adresse'],
                                description: snapshot.data![index]
                                    ['description'],
                                ville: snapshot.data![index]['ville'],
                                image: snapshot.data![index]['image'],
                                category_id: snapshot.data![index]
                                    ['category_id'],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        currentIndex: 0,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu_sharp), label: 'menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: 'panier'),
        ],
      ),
    );
  }
}
