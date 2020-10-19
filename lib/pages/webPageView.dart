import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    // withInternet = _checkForConnection();
    isloading = true;
  }

  Future searchNetwork() async {
    var data = get("https://www.google.com");
    return data;
  }

  bool isloading;
  WebViewController _webViewcontroller;
  bool withInternet;

  _onWillPopCallback() async {
    var canGoBack = _webViewcontroller.canGoBack();

    if (canGoBack as bool == true) {
      _webViewcontroller.goBack();
      return false;
    }
    Navigator.pop(context);
    return true;
  }

  _checkForConnection() {
    return DataConnectionChecker().hasConnection;
  }

  _reloadPage() {
    _webViewcontroller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: WebView(
            onWebResourceError: (error) {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (contect) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text(
                          "Sorry this page could not be loaded, check your internet connection and reload"),
                      actions: [
                        FlatButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("exit"),
                        ),
                        FlatButton(
                          onPressed: () {
                            _reloadPage();
                            Navigator.pop(context);
                          },
                          child: Text("Reload"),
                        )
                      ],
                    );
                  });
            },
            onPageStarted: (url) => setState(
              () => isloading = true,
            ),
            onPageFinished: (url) => setState(
              () => isloading = false,
            ),
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: _onWebViewCreatedCallback,
          ),
        ),
        isloading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              )
            : Center()
      ],
    );
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.all(12.0),
    //           child: Text(
    //             "Sorry, an error has occurs. check your internet and try again",
    //             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    //             textAlign: TextAlign.center,
    //             softWrap: true,
    //           ),
    //         ),
    //         MaterialButton(
    //           color: Colors.blue,
    //           child: Text("Retry"),
    //           onPressed: () => setState(
    //             () {
    //               withInternet = true;
    //             },
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  void _onWebViewCreatedCallback(controller) {
    Timer(
      Duration(seconds: 5),
      () => setState(
        () {
          isloading = false;
        },
      ),
    );
    setState(
      () {
        _webViewcontroller = controller;
      },
    );
  }
}
