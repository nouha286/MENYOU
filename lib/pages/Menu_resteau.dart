import 'package:flutter/material.dart';

class Menu_resteau extends StatelessWidget {
  const Menu_resteau({super.key});

  @override
  Widget build(BuildContext context) {
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
            GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 7 / 8,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                children: [])
          ],
        ),
      ),
    );
  }
}
