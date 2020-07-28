import 'package:Bookeyy/pages/webPageView.dart';
import 'package:Bookeyy/routing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final categories = [
  {
    "icon": FontAwesomeIcons.microphone,
    "label": "Entertainment",
    "url": "https://bookeyy.com/entertainment",
  },
  {
    "icon": FontAwesomeIcons.basketballBall,
    "label": "Sports",
    "url": "https://bookeyy.com/sport-center/",
  },
  {
    "icon": FontAwesomeIcons.shirtsinbulk,
    "label": "Fashion",
    "url": "https://bookeyy.com/fashion/",
  },
  {
    "icon": FontAwesomeIcons.stethoscope,
    "label": "Health",
    "url": "https://bookeyy.com/health-care/"
  },
];

class MyGrids extends StatelessWidget {
  MyGrids({this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List<Widget>.generate(
        4,
        (index) => CategoryCard(
          iconData: categories[index]['icon'],
          label: categories[index]['label'],
          url: categories[index]["url"],
          token: token,
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.iconData,
    @required this.label,
    @required this.url,
    this.token = "",
    this.nonce,
  }) : super(key: key);

  final IconData iconData;
  final String label;
  final url;
  final token;
  final nonce;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          routeTo(
            WebPageView(
              url: url,
              token: token,
            ),
          ),
        ),
        child: Card(
          elevation: 8.0,
          color: Colors.white,
          shadowColor: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.orange,
                  size: 40.0,
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
