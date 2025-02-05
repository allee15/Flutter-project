import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/animal.dart';

class AnimalDetailsScreen extends StatelessWidget {
  final Animal animal;

  AnimalDetailsScreen({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Animal details")),
        body: Center(child: Text("Animal details")));
  }
}
