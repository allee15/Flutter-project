import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/AnimalDetails/animal_details_view_model.dart';
import 'package:flutter_application_1/UI/ContactUs/contact_us_view_model.dart';
import 'package:flutter_application_1/UI/Home/home_view_model.dart';
import 'package:flutter_application_1/UI/root_view.dart';
import 'package:provider/provider.dart';
import 'package:network_inspector/network_inspector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkInspector.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RootViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewmodel()),
        ChangeNotifierProvider(create: (context) => AnimalDetailsViewModel(0)),
        ChangeNotifierProvider(create: (context) => ContactUsViewModel())
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
