import 'package:flutter/material.dart';
import '../Home/home_screen.dart';
import '../ContactUs/contact_us_screen.dart';

class TabBarViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  static List<Widget> _tabBarOptions = <Widget>[
    HomeScreen(),
    ContactUsScreen(),
  ];

  int get selectedIndex => _selectedIndex;

  List<Widget> get tabBarOptions => _tabBarOptions;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
