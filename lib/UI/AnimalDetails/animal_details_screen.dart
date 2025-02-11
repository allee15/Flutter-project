import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/animal.dart';
import 'package:flutter_application_1/UI/AnimalDetails/animal_details_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Model/animal_details.dart';

class AnimalDetailsScreen extends StatefulWidget {
  final Animal animal;

  AnimalDetailsScreen({required this.animal});

  @override
  _AnimalDetailsScreenState createState() => _AnimalDetailsScreenState();
}

class _AnimalDetailsScreenState extends State<AnimalDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AnimalDetailsViewModel>(context, listen: false)
        .getAnimalDetails(widget.animal.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Animal details")),
        body: Consumer<AnimalDetailsViewModel>(
            builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 2),
                Row(children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 2),
                  CircularProgressIndicator(color: Colors.teal),
                  SizedBox(width: MediaQuery.of(context).size.width / 2),
                ]),
                SizedBox(height: MediaQuery.of(context).size.height / 2),
              ],
            );
          }

          if (viewModel.errorMessage != null) {
            return Center(
                child: Text(viewModel.errorMessage!,
                    style: TextStyle(color: Colors.teal)));
          }

          if (viewModel.animalDetails != null) {
            return AnimalDetailsWidget(animalDetails: viewModel.animalDetails!);
          } else {
            return Center(
                child: Text("No animal details to show",
                    style: TextStyle(color: Colors.deepOrange)));
          }
        }));
  }
}

class AnimalDetailsWidget extends StatelessWidget {
  const AnimalDetailsWidget({required this.animalDetails});

  final AnimalDetails animalDetails;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Flexible(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 12),
                Image.network(animalDetails.imageUrl,
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.4,
                    scale: 2,
                    fit: BoxFit.fill),
                SizedBox(width: 8)
              ],
            ),
            SizedBox(height: 16),
            Text('🔹 Name: ${animalDetails.name}', maxLines: 3),
            Text('🔹 Age: ${animalDetails.age}', maxLines: 3),
            Text('🔹 Type: ${animalDetails.type}', maxLines: 3),
            Text('🔹 Species: ${animalDetails.species}', maxLines: 3),
            Text('🔹 Breed: ${animalDetails.breed}', maxLines: 3),
            Text('🔹 Fur color: ${animalDetails.furColor}', maxLines: 3),
            Text('🔹 Gender: ${animalDetails.gender}', maxLines: 3),
            Text('🔹 Size: ${animalDetails.size}', maxLines: 3),
            Text('🔹 About: ${animalDetails.description}', maxLines: 10)
          ],
        )));
  }
}
