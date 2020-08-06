import 'package:Bookeyy/pages/webPageView.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  Booking({this.token});

  final token;

  @override
  _BookingState createState() => _BookingState(token: token);
}

class _BookingState extends State<Booking> {
  _BookingState({this.token});
  final token;

  bool noInternet = false;

  @override
  Widget build(BuildContext context) {
    return WebPageView(
      url: "https://bookeyy.com/customer-panel/",
    );
  }
}
