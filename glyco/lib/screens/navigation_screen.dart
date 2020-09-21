import 'package:flutter/material.dart';
import '../widgets/appBars/measures_app_bar.dart';
import '../widgets/appBars/challenges_app_bar.dart';
import '../widgets/appBars/settings_app_bar.dart';
import './challenges_screen.dart';
import './measures_screen.dart';
import './settings_screen.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 1;
  static List<Widget> _screens = <Widget>[
    ChallengesScreen(),
    MeasuresScreen(),
    SettingsScreen(),
  ];

  static List<Widget> _appBars = <Widget>[
    ChallengesAppBar(),
    MeasuresAppBar(),
    SettingsAppBar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars.elementAt(_selectedIndex),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 60,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            title: Text('Challenges'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            title: Text('Measures'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
