import 'package:Bookeyy/pages/webPageView.dart';
import 'package:Bookeyy/webServices/httpService.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({this.token});

  final token;

  @override
  Widget build(BuildContext context) {
    return WebPageView(
      token: token,
      url: "https://bookeyy.com/search/",
    );
  }
}
