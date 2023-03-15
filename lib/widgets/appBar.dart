import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  const appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
      title: new Text("Menyou",
          style: const TextStyle(
              color: Color.fromARGB(255, 98, 98, 98),
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 19.0)),
    );
  }
}
