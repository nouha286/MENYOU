import 'package:flutter/material.dart';
import 'package:menyou/pages/Home.dart';
import 'package:menyou/pages/Panier.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List pages = [Home(), Home(), PannierPage()];
  int currentIndex = 0;

  void _updateIndex(int value) {
    setState(() {
      currentIndex = value;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pages[value]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _updateIndex,
      currentIndex: currentIndex,
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_sharp), label: 'menu'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket), label: 'panier'),
      ],
    );
  }
}
