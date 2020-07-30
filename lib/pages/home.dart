import 'package:Bookeyy/Widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:Bookeyy/Widgets/noInternet.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  Home({this.token});

  final token;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    token = widget.token;
  }

  bool noInternet = false;
  String token;

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
                      )),
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
//                Row(
//                  children: <Widget>[
//                    IconButton(
//                      icon: Icon(
//                        Icons.menu,
//                        size: 40.0,
//                        color: Colors.blue,
//                      ),
//                      onPressed: () =>
//                          widget.scafoldKey.currentState.openEndDrawer(),
//                    ),
//                  ],
//                )
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
                      onTap: null,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/catering.png",
                                height: 80.0),
                            Text("Catering Services")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/futsal.png",
                              height: 80.0,
                            ),
                            Text("Catering Services")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/makeup.png",
                              height: 80.0,
                            ),
                            Text("Catering Services")
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
                      onTap: null,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/doctor.png",
                              height: 80.0,
                            ),
                            Text("Catering Services")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/catering.png",
                              height: 80.0,
                            ),
                            Text("Catering Services")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/bus.png",
                              height: 80.0,
                            ),
                            Text("Catering Services")
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

class Category extends StatelessWidget {
  Category({this.image, this.label, this.ontap});

  final image, label, ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100.0,
              child: Image.asset(
                image,
                width: 110.0,
              ),
            ),
            Text(label)
          ],
        ),
      ),
    );
  }
}
