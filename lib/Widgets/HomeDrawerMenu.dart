import 'package:Bookeyy/pages/home.dart';
import 'package:Bookeyy/pages/webPageView.dart';
import 'package:Bookeyy/routing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDrawerMenu extends StatelessWidget {
  final TextStyle textStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
  HomeDrawerMenu({this.token});
  final token;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6.0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              child: Image.asset(
                "assets/images/sub1.png",
                width: 280.0,
                color: Colors.white,
                fit: BoxFit.contain,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              height: 200.0,
              width: 350.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          ListTile(
            title: Text(
              "About Us",
              style: textStyle,
            ),
            leading: Icon(FontAwesomeIcons.question, color: Colors.blue),
            onTap: () {
              Navigator.of(context).push(
                routeTo(
                  WebPageView(
                    url: "https://bookeyy.com/about/",
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              "Contact Us",
              style: textStyle,
            ),
            leading: Icon(
              FontAwesomeIcons.phone,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                routeTo(
                  WebPageView(
                    url: "https://bookeyy.com/contact/",
                  ),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
