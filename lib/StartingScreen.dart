import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'globalAllScreen.dart';
import 'countryScreen.dart';
import 'aboutScreen.dart';
class CoronaVirusTracker extends StatefulWidget {
  @override
  _CoronaVirusTrackerState createState() => _CoronaVirusTrackerState();
}

class _CoronaVirusTrackerState extends State<CoronaVirusTracker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CoronaDrawer());
  }
}

class CoronaDrawer extends StatefulWidget {
  @override
  _CoronaDrawerState createState() => _CoronaDrawerState();
}

class _CoronaDrawerState extends State<CoronaDrawer> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    globalAll(),
    Country(),
    About(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.globe),
            title: Text('Global'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.flag),
            title: Text('Countries'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.address_card),
            title: Text('About'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
