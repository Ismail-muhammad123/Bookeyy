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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Sorry, an error has occurs. check your internet and try again",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            MaterialButton(
              color: Colors.blue,
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
