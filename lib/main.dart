import 'package:flutter/material.dart';
import 'package:flutter_all_important_package/Nav%20Bar/Foodie_type/foodie_home.dart';
import 'package:flutter_all_important_package/Nav%20Bar/ModernBottonNavBar/modern_bottom_navbar.dart';
import 'package:flutter_all_important_package/Nav%20Bar/navbar_visibility/navbar_visibility.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  NavbarVisibility(),
    );
  }
}
