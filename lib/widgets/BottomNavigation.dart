
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
