import 'package:Bookeyy/Widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:Bookeyy/Widgets/noInternet.dart';

class Home extends StatefulWidget {
  Home({this.token});

  final token;

  @override
  _HomeState createState() => _HomeState(token: token);
}

class _HomeState extends State<Home> {
  _HomeState({this.token});

  @override
  void initState() {
    super.initState();
  }

  bool noInternet = false;
  final String token;

  @override
  Widget build(BuildContext context) {
    return noInternet
        ? NoInternet()
        : HomeTab(
            token: token,
          );
  }
}

class HomeTab extends StatelessWidget {
  HomeTab({this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    var children2 = <Widget>[
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(250.0, 200.0),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
        child: Text(
          "All Your Booking Needs Under \nOne Roof",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "NatoSrif"),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 100.0, left: 105.0, bottom: 30.0),
        child: Text(
          "Categories",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontFamily: "NatoSrif"),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 140.0),
        child: MyGrids(
          token: token,
        ),
      )
    ];
    return Stack(
      children: children2,
    );
  }
}
