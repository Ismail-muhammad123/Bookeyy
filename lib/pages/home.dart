import 'package:Bookeyy/pages/webPageView.dart';
import 'package:Bookeyy/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool noInternet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(200.0),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(180.0),
                  ),
                  child: Image.asset(
                    "assets/images/image1.jpg",
                    fit: BoxFit.fitWidth,
                    height: 300.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    right: 40.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/sub2.png",
                        height: 45.0,
                      ),
                      Image.asset(
                        "assets/images/sub1.png",
                        height: 45.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0,
                        color: Colors.orange),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          routeTo(
                            WebPageView(
                              url: "https://bookeyy.com/entertainment",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/show.png",
                                height: 80.0),
                            Text(
                              "Entertainment",
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          routeTo(
                            WebPageView(
                              url: "https://bookeyy.com/sport-center/",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/futsal.png",
                              height: 80.0,
                            ),
                            Text(
                              "Sport Centers",
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          routeTo(
                            WebPageView(
                              url: "https://bookeyy.com/fashion/",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/makeup.png",
                              height: 80.0,
                            ),
                            Text(
                              "Fashion Design",
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          routeTo(
                            WebPageView(
                              url: "https://bookeyy.com/health-care/",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/doctor.png",
                              height: 80.0,
                            ),
                            Text(
                              "Health care",
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Not Available"),
                            content: Text(
                                "Sorry, this feature is not available yet, but it is comming soon"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Okay"),
                              ),
                            ],
                          ),
                          barrierDismissible: true,
                        );
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/catering.png",
                              height: 80.0,
                            ),
                            Text(
                              "Catering",
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Not Available"),
                            content: Text(
                                "Sorry, this feature is not available yet, but it is comming soon"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Okay"),
                              )
                            ],
                          ),
                          barrierDismissible: true,
                        );
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/bus.png",
                              height: 80.0,
                              width: 100.0,
                            ),
                            Text(
                              "Transportation",
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
