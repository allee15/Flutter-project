import 'package:flutter/material.dart';
import 'tab_bar_view_model.dart';
import 'package:provider/provider.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TabBarViewModel(),
      child: Consumer<TabBarViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: viewModel.tabBarOptions[viewModel.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.contact_mail), label: "Contact us"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile")
              ],
              currentIndex: viewModel.selectedIndex,
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.blueGrey,
              onTap: viewModel.onItemTapped,
              type: BottomNavigationBarType.fixed,
            ),
          );
        },
      ),
    );
  }
}
