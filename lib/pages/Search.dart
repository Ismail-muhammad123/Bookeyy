import 'package:Bookeyy/pages/webPageView.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({this.token});

  final token;

  @override
  Widget build(BuildContext context) {
    return WebPageView(
      url: "https://bookeyy.com/search/",
    );
  }
}
