import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(child: Text('hi')),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Text('hi'),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      color: Colors.red.shade300,
                    ))
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Image.asset(
                  'images/humberguer.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ));
  }
}
