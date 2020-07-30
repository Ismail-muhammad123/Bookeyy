import 'dart:io';
import 'package:Bookeyy/Widgets/noInternet.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class WebPageView extends StatefulWidget {
  WebPageView({this.token, this.url});
  final token;
  final url;

  @override
  _WebPageViewState createState() => _WebPageViewState();
}

class _WebPageViewState extends State<WebPageView> {
  @override
  void initState() {
    super.initState();
    isloading = false;
  }

  bool isloading;
  WebViewController _webViewcontroller;
  String usertoken;

  Future<bool> _checkForInternet() async {
    bool res;
   try{
     final response = await http.get("https://google.com");
     res = (response.statusCode == 200)? true : false;
   } catch(e){
     res = false;
   }

   return res;

  }

  @override
  Widget build(BuildContext context) {
    final withInternet = _checkForInternet() as bool;
    if (withInternet == true) {
      return Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: WebView(
                initialUrl: "https://bookeyy.com",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  _webViewcontroller = controller;
                  if (widget.token != null) {
                    _webViewcontroller.loadUrl(
                      widget.url,
                      headers: {
                        HttpHeaders.authorizationHeader:
                            "Bearer " + widget.token,
                      },
                    );
                  } else {
                    _webViewcontroller.loadUrl(
                      widget.url,
                    );
                  }
                },
              ),
            ),
          ),
          isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center()
        ],
      );
    }
    return NoInternet(
      page: WebPageView(
        token: widget.token,
        url: widget.url,
      ),
    );
  }
}
