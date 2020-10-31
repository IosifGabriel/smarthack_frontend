import 'package:flutter/material.dart';
import '../tabs/tabs.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 1;
  List<Widget> _children = <Widget>[
    HomeTab(),
    DocumentTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: SafeArea(
        child: _children.elementAt(_currentTab),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      //       icon: Icon(Icons.list),
      //       label: 'My document',
      //     ),
      //   ],
      //   currentIndex: _currentTab,
      //   onTap: (index) {
      //     setState(() {
      //       _currentTab = index;
      //     });
      //   },
      //   selectedItemColor: Colors.deepOrangeAccent,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      // ),
    );
  }
}
