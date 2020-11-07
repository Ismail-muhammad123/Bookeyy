import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:webview_flutter/webview_flutter.dart';
import "package:url_launcher/url_launcher.dart";

class WebPageView extends StatefulWidget {
  WebPageView({this.url});

  final url;

  @override
  _WebPageViewState createState() => _WebPageViewState();
}

class _WebPageViewState extends State<WebPageView> {
  @override
  initState() {
    super.initState();
    isloading = false;
  }

  bool isloading;
  WebViewController _webViewcontroller;
  bool withInternet;

  _reloadPage() {
    _webViewcontroller.reload();
  }

  _launchUrl(url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "could not lunch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: null,
      body: Stack(
        children: [
          SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                if (_webViewcontroller.canGoBack() == true) {
                  _webViewcontroller.goBack();
                  return false;
                }
                return true;
              },
              child: WebView(
                navigationDelegate: (action) {
                  if (action.url.startsWith("whatsapp://")) {
                    launch(action.url);
                    return NavigationDecision.prevent;
                  } else if (action.url.startsWith("tel:")) {
                    launch(action.url);
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
                onWebResourceError: (error) {
                  setState(
                    () => isloading = false,
                  );
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (contect) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Icon(
                                Icons.error,
                              ),
                              Text("Error"),
                            ],
                          ),
                          content: Text(
                            "Sorry this page could not be loaded, try checking "
                            "your internet connection and reload",
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                _reloadPage();
                                Navigator.pop(context);
                              },
                              child: Text("Okay"),
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
                onWebViewCreated: (controller) => setState(
                  () {
                    _webViewcontroller = controller;
                  },
                ),
              ),
            ),
          ),
          isloading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
