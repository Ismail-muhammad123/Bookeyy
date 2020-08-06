import 'package:Bookeyy/Widgets/HomeDrawerMenu.dart';
import 'package:Bookeyy/pages/Search.dart';
import 'package:Bookeyy/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:Bookeyy/pages/Booking.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _tabedPages = <Widget>[
      Home(),
      Booking(),
      Search(),
    ];
  }

  Widget _tabTitle;
  List<Widget> _tabedPages;

  int _selectedIndex = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  void _selectedItemChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _navItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      title: Text(
        "Home",
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.bookmark_border,
      ),
      title: Text(
        "Bookings",
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      title: Text(
        "Search",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   title: _tabTitle,
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      drawer: HomeDrawerMenu(),
      bottomNavigationBar: BottomNavigationBar(
        items: _navItems,
        elevation: 4.0,
        currentIndex: _selectedIndex,
        iconSize: 25.0,
        selectedItemColor: Colors.black87,
        onTap: _selectedItemChanged,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: _selectedIndex == 0
          ? SafeArea(
              child: Stack(
//                key: UniqueKey(),
                children: <Widget>[
                  Home(),
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 43.0,
                      color: Colors.blue,
                    ),
                    onPressed: () => scaffoldKey.currentState.openDrawer(),
                  ),
                ],
              ),
            )
          : _tabedPages[_selectedIndex],
    );
  }
}
