import 'package:flutter/material.dart';

class sideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/Home');
              },
              child: ListTile(
                title: Text(
                  "Page principale",
                  style: TextStyle(fontSize: 20.0),
                ),
                leading: Icon(
                  Icons.home,
                  color: Colors.redAccent,
                  size: 30.0,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/Favoris');
              },
              child: ListTile(
                title: Text(
                  "Favoris",
                  style: TextStyle(fontSize: 20.0),
                ),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                  size: 30.0,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  "Caisse",
                  style: TextStyle(fontSize: 20.0),
                ),
                leading: Icon(
                  Icons.attach_money,
                  color: Colors.redAccent,
                  size: 30.0,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
        ]),
      ),
    );
  }
}
