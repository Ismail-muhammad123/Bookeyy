import 'package:Bookeyy/routing.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  NoInternet({this.page});
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Sorry, an error has occurs. check your internet and try again",
              softWrap: true,
            ),
            MaterialButton(
              child: Text("Retry"),
              onPressed: () => Navigator.of(context).pushReplacement(
                routeTo(page),
              ),
            )
          ],
        ),
      ),
    );
  }
}
