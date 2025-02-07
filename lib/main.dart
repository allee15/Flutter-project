import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Home/home_view_model.dart';
import 'package:flutter_application_1/UI/root_view.dart';
import 'package:provider/provider.dart';

Future main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RootViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewmodel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet finder',
      theme: ThemeData(primaryColor: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: RootView(),
    );
  }
}
