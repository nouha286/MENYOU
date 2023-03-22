import 'package:flutter/material.dart';
import 'package:menyou/database/SqlDb.dart';
import 'package:menyou/models/Plat.dart';
import 'package:menyou/pages/DetailsPlat.dart';
import 'package:menyou/widgets/BottomNavigation.dart';
import 'package:menyou/widgets/Search.dart';
import 'package:menyou/widgets/TextBadge.dart';

class Menu_resteau extends StatelessWidget {
  final int id_resteau;
  Menu_resteau({required this.id_resteau});

  @override
  Widget build(BuildContext context) {
    SqlDb sqlDb = SqlDb();

    Future<List<Plat>> getPlat() async {
      final List<Map<String, dynamic>> response = await sqlDb
          .readData("SELECT * FROM Plat WHERE resteau_id=${this.id_resteau}");

      return response.map((response) => Plat.fromJson(response)).toList();
    }

    return Container(
      child: Scaffold(
        appBar: AppBar(
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
        body: Column(
          children: [
            Search(),
            Container(
              height: 500,
              child: FutureBuilder<List<Plat>>(
                  future: getPlat(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              final plat = snapshot.data![index];
                              return MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlatDetailsPage(
                                                id: plat.id,
                                                nom: plat.nom,
                                                ingredient: snapshot
                                                    .data![index].ingredient,
                                                classification: snapshot
                                                    .data![index]
                                                    .classification,
                                                resteau_id: snapshot
                                                    .data![index].resteau_id,
                                                prix: plat.prix,
                                                image: plat.image,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(color: Colors.red),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(3, 7),
                                              blurRadius: 25,
                                              color: Colors.black38)
                                        ]),
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(snapshot
                                                        .data![index].image))),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${plat.nom}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0,
                                                      color: Colors.redAccent)),
                                              Text('${plat.prix}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.0)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            plat.ingredient,
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextBadge(
                                                text: snapshot
                                                    .data![index].classification
                                                    .toString()
                                                    .split('.')
                                                    .last,
                                                color: Colors.red,
                                                borderRadius: 20,
                                                textStyle: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 1,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.redAccent,
                                                ),
                                              ]),
                                        ]),
                                  ));
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }),
            ),
          ],
        ),
         bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
