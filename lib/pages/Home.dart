import 'package:flutter/material.dart';
import 'package:menyou/models/Categorie.dart';
import 'package:menyou/widgets/Categories.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Flexible(
                  child: Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'localisation courrante  ▼',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Row(children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.red.shade100),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 25,
                          color: Colors.red.shade100)
                    ]),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search ...',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search))),
              )),
              SizedBox(
                width: 10.0,
              ),
              Container(
                child: Icon(
                  Icons.menu_open,
                  color: Colors.red,
                ),
              ),
            ]),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Categories();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
