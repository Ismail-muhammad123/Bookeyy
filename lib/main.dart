import 'package:Bookeyy/pages/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Bookeyy());
}

class Bookeyy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
