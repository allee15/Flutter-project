import 'package:flutter/material.dart';
import '../Home/home_screen.dart';

class TabBarViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  static List<Widget> _tabBarOptions = <Widget>[
    HomeScreen(),
    const Center(child: Text('Contact us')),
    const Center(child: Text('Profile'))
  ];

  int get selectedIndex => _selectedIndex;

  List<Widget> get tabBarOptions => _tabBarOptions;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
