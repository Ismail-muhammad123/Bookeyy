import 'package:Bookeyy/pages/webPageView.dart';
import 'package:Bookeyy/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final _decoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ],
  color: Colors.white,
);

class _HomeState extends State<Home> {
  bool noInternet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CartegoryCard(
                          url: "https://bookeyy.com/entertainment",
                          label: "Entertainment",
                          imageAsset: "assets/images/show.png",
                        ),
                        CartegoryCard(
                          url: "https://bookeyy.com/sport-center/",
                          imageAsset: "assets/images/futsal.png",
                          label: "Sport Centers",
                        ),
                        CartegoryCard(
                          url: "https://bookeyy.com/fashion/",
                          imageAsset: "assets/images/makeup.png",
                          label: "Fashion Design",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CartegoryCard(
                          url: "https://bookeyy.com/health-care/",
                          imageAsset: "assets/images/doctor.png",
                          label: "Health care",
                        ),
                        ComingSoonCategory(
                          imageAsset: "assets/images/catering.png",
                          label: "Catering",
                        ),
                        ComingSoonCategory(
                          imageAsset: "assets/images/bus.png",
                          label: "Transportation",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ComingSoonCategory extends StatelessWidget {
  const ComingSoonCategory({
    Key key,
    this.imageAsset,
    this.label,
  }) : super(key: key);

  final imageAsset, label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Not Available"),
            content: Text(
              "Sorry, this feature is not available yet, but it is coming soon",
            ),
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
      child: Card(
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(8.0),
          // decoration: _decoration,
          child: Column(
            children: <Widget>[
              Image.asset(
                imageAsset,
                height: 80.0,
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartegoryCard extends StatelessWidget {
  const CartegoryCard({
    Key key,
    this.url,
    this.label,
    this.imageAsset,
  }) : super(key: key);

  final String url, label, imageAsset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          routeTo(
            WebPageView(
              url: url,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(8.0),
          // decoration: _decoration,
          child: Column(
            children: <Widget>[
              Image.asset(
                imageAsset,
                height: 80.0,
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
