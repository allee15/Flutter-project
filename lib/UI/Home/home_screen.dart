import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/animal.dart';
import 'package:flutter_application_1/UI/AnimalDetails/animal_details_screen.dart';
import 'package:flutter_application_1/UI/Home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Consumer<HomeViewmodel>(builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator(color: Colors.teal));
          }
          if (viewModel.errorMessage != null) {
            return Center(
                child: Text(viewModel.errorMessage!,
                    style: TextStyle(color: Colors.teal)));
          }

          if (viewModel.animals.isNotEmpty) {
            return ListView.builder(
                itemCount: viewModel.animals.length,
                itemBuilder: (context, index) {
                  return AnimalWidget(animal: viewModel.animals[index]);
                });
          } else {
            return Center(child: Text("No animals to show"));
          }
        }));
  }
}

class AnimalWidget extends StatelessWidget {
  const AnimalWidget({required this.animal});

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AnimalDetailsScreen(animal: animal)),
          );
        },
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            elevation: 2.0,
            margin: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 12),
                    Image.network(animal.imageUrl,
                        width: 84, height: 84, scale: 1, fit: BoxFit.fill),
                    SizedBox(width: 24),
                    Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${animal.name}", maxLines: 3),
                            Text("Age: ${animal.age}",
                                style: TextStyle(color: Colors.teal),
                                maxLines: 3),
                            Text("Breed: ${animal.breed}",
                                style: TextStyle(color: Colors.blueGrey),
                                maxLines: 3),
                            Text("Fur color: ${animal.furColor}",
                                style: TextStyle(color: Colors.blueGrey),
                                maxLines: 3)
                          ]),
                    ),
                    SizedBox(width: 12)
                  ],
                ),
                SizedBox(height: 12)
              ],
            )));
  }
}
