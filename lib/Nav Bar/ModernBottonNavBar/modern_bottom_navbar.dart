import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ModernBottomNavbar extends StatefulWidget {
  const ModernBottomNavbar({super.key});

  @override
  State<ModernBottomNavbar> createState() => _ModernBottomNavbarState();
}

class _ModernBottomNavbarState extends State<ModernBottomNavbar> {
  final List<Widget> _navigationItem = [
    const Icon(Icons.home),
    const Icon(Icons.dashboard),
    const Icon(Icons.shopping_cart),
    const Icon(Icons.settings),
    const Icon(Icons.person),
  ];
  Color bgColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: bgColor,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: _navigationItem,
        backgroundColor: bgColor,
        index: 2,
        // height: 70,
        // buttonBackgroundColor: Colors.deepPurple,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          if (index == 0) {
            bgColor = Colors.blue;
          } else if (index == 1) {
            bgColor = Colors.red;
          } else if (index == 2) {
            bgColor = Colors.green;
          } else if (index == 3) {
            bgColor == Colors.red;
          } else if (index == 4) {
            bgColor == Colors.amber;
          }
          setState(() {});
        },
      ),
    );
  }
}
