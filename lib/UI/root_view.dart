import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/TabBar/tab_bar_screen.dart';

class RootView extends StatefulWidget {
  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TabBarScreen());
  }
}
