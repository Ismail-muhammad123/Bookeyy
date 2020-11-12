import 'package:Bookeyy/Widgets/HomeDrawerMenu.dart';
import 'package:Bookeyy/pages/Search.dart';
import 'package:Bookeyy/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:Bookeyy/pages/Booking.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.bookmark_border,
      ),
      label: "My Bookings",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      label: "Search",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(
            () {
              _selectedIndex = 0;
            },
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: HomeDrawerMenu(),
        bottomNavigationBar: BottomNavigationBar(
          items: _navItems,
          elevation: 12.0,
          currentIndex: _selectedIndex,
          iconSize: 25.0,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: _selectedItemChanged,
        ),
        body: _selectedIndex == 0
            ? SafeArea(
                child: Stack(
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
      ),
    );
  }
}
