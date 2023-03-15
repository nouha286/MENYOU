import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(25),
              // border: Border.all(color: Colors.red),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 3), blurRadius: 25, color: Colors.red)
              ]),
          child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search ...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search))),
        )),
      ]),
    );
  }
}
