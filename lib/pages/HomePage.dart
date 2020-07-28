import 'package:Bookeyy/Widgets/HomeDrawerMenu.dart';
import 'package:Bookeyy/pages/Search.dart';
import 'package:Bookeyy/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:Bookeyy/pages/Booking.dart';

class HomePage extends StatefulWidget {
  HomePage({this.id, this.token});

  final token;
  final id;

  @override
  _HomePageState createState() => _HomePageState(id: id, token: token);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({this.id, this.token});

  @override
  void initState(){
    super.initState();
    _tabedPages = <Widget>[
      Home(token: token,),
      Booking(token: token,),
      Search(),
    ];
  }

  Widget _tabTitle;


  int _selectedIndex = 0;
  static List<Widget> _tabTitles = [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/images/sub2.png",
          color: Colors.white,
          height: 30.0,
          width: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 0,
          ),
          child: Text(
            "BOOKEYY",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
    Text("Bookings"),
    Text("Search"),
  ];

  final int id;
  final String token;

  void _selectedItemChanged(int index) {
    setState(() {
      _selectedIndex = index;
      _tabTitle = _tabTitles[index];
    });
  }


   List<Widget> _tabedPages;

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
      appBar: AppBar(
        title: _tabTitle,
        centerTitle: true,
        elevation: 0,
      ),
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
      body: _tabedPages[_selectedIndex],
    );
  }
}
