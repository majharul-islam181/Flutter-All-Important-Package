import 'package:flutter/material.dart';

class Dashborad extends StatelessWidget {
  const Dashborad({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Dashborads Screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
