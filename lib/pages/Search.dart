import 'package:Bookeyy/webServices/httpService.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    super.initState();
    noInternet = true;
    webServices = new WebServices();
  }

  WebViewController controller;
  bool noInternet;
  WebServices webServices;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://bookeyy.com/search/",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        controller.loadUrl("https://bookeyy.com/search/");
      },
    );
  }
}
