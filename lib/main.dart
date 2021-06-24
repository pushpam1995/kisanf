import 'package:flutter/material.dart';

import 'kisan_screens/splash_screen.dart';



void main() {
  runApp(FormerConnecto());
}

class FormerConnecto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      );
  }
}