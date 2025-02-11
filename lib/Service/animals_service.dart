import 'package:flutter_application_1/API/animals_api.dart';
import 'package:flutter_application_1/Model/animal.dart';
import 'package:flutter_application_1/Model/animal_details.dart';

class AnimalsService {
  final AnimalsAPi animalsApi = AnimalsAPi();

  List<Animal> animals = [];
  AnimalDetails? animalDetails;

  Future<void> getAnimals() async {
    try {
      animals = await animalsApi.getAnimals();
    } catch (error) {
      print('Error loading animals $error');
      throw Exception('Failed to load animal details');
    }
  }

  Future<void> getAnimalDetails(int animalId) async {
    try {
      animalDetails = await animalsApi.getAnimalDetails(animalId);
    } catch (error) {
      print('Error loading animal details $error');
    }
  }
}
