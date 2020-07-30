import 'dart:async';
import 'package:Bookeyy/routing.dart';
import 'package:flutter/material.dart';
import 'signIn.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        routeTo(
          SigninPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 250.0, left: 50.0, right: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Image.asset(
                "assets/images/sub2.png",
                width: 130,
                color: Colors.blue,
              ),
            ),
            Image.asset(
              "assets/images/sub1.png",
              height: 100,
              width: 450,
              color: Colors.blue,
            ),
          ],
        ),
      )),
    );
  }
}
