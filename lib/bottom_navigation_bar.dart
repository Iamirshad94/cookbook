import 'package:cookbook/global.dart';
import 'package:cookbook/home_page.dart';
import 'package:cookbook/search.dart';
import 'package:flutter/material.dart';

class BottomNavi extends StatefulWidget {
  @override
  _BottomNaviState createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int _selectedPage = 1;
  final List<Widget> _children = [
    SearchScreen(),
    HomePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: base_color,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        currentIndex: _selectedPage,

        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
            title: new Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.fastfood_rounded,
            ),
            title: new Text('Cuisine'),
          ),
        ],
      ),
    );
  }
}
