import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class WebPageView extends StatefulWidget {
  WebPageView({this.url});

  final url;

  @override
  _WebPageViewState createState() => _WebPageViewState();
}

class _WebPageViewState extends State<WebPageView> {
  @override
  void initState() {
    super.initState();

    isloading = true;
  }


  bool isloading;
  WebViewController _webViewcontroller;
  bool withInternet;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataConnectionChecker().hasConnection,
      builder: (context, snapshot) {
        if (snapshot.hasData ) {

          return Stack(
            children: [
              Scaffold(
                body: SafeArea(
                  child: WillPopScope(
                    onWillPop: () async {
                      var canGoBack = _webViewcontroller.canGoBack();

                      if (canGoBack as bool) {
                        _webViewcontroller.goBack();
                        return false;
                      } else {
                        return true;
                      }
                    },
                    child: WebView(
                      initialUrl: widget.url,
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (controller) {
                        setState(
                          () {
                            _webViewcontroller = controller;
                          },
                        );

                        Timer(
                          Duration(seconds: 5),
                          () => setState(
                            () {
                              isloading = false;
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              isloading
                  ? Center(
                      child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ))
                  : Center()
            ],
          );
        } else {

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
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    child: Text("Retry"),
                    onPressed: () => setState(() {
                      withInternet = true;
                    }),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
