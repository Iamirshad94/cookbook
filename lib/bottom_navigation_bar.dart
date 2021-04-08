import 'package:cookbook/global.dart';
import 'package:cookbook/home_page.dart';
import 'package:cookbook/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(title: Text('Are you sure you want to quit?'), actions: <Widget>[
                  RaisedButton(
                      child: Text('Exit'),
                      onPressed: () => SystemNavigator.pop()),
                  RaisedButton(
                      child: Text('cancel'),
                      onPressed: () => Navigator.of(context).pop(false)),
                ]));
return false;
      },

      child: Scaffold(
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
      ),
    );
  }
}
