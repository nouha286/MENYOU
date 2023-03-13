import 'package:flutter/material.dart';
import 'package:menyou/database/SqlDb.dart';
import 'package:menyou/widgets/TextBadge.dart';

class Menu_resteau extends StatelessWidget {
  final int id_resteau;
  Menu_resteau({required this.id_resteau});

  @override
  Widget build(BuildContext context) {
    SqlDb sqlDb = SqlDb();

    Future<List<Map>> readData() async {
      List<Map> reponse = await sqlDb
          .readData("SELECT * FROM Plat WHERE resteau_id=${this.id_resteau}");
      return reponse;
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
                          hintText: 'Search ...',
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search))),
                )),
              ]),
            ),
            Container(
              height: 500,
              child: FutureBuilder(
                  future: readData(),
                  builder:
                      (BuildContext ctx, AsyncSnapshot<List<Map>> snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              return MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/FoodDetailsPage');
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 40, bottom: 0, left: 10, right: 10),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 30),
                                    child: new Stack(
                                      children: <Widget>[
                                        Card(
                                            elevation: 10, // Change this
                                            shadowColor: Colors.redAccent,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 60, bottom: 20),
                                              child: ListTile(
                                                title: Text(
                                                    '${snapshot.data![index]['nom']}'),
                                                subtitle: Text(
                                                    '${snapshot.data![index]['ingredient']}'),
                                                trailing: TextBadge(
                                                  text: snapshot.data![index]
                                                          ['classification']
                                                      .toString(),
                                                  color: Colors.redAccent,
                                                  borderRadius: 60,
                                                  textStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    letterSpacing: 1,
                                                  ),
                                                ),
                                              ),
                                            )),
                                        FractionalTranslation(
                                          translation: Offset(0.0, -0.4),
                                          child: Align(
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  '${snapshot.data![index]['image']}'),
                                              radius: 50,
                                            ),
                                            alignment:
                                                FractionalOffset(0.5, 0.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
