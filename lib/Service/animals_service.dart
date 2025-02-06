import 'package:flutter_application_1/API/animals_api.dart';
import 'package:flutter_application_1/Model/animal.dart';

class AnimalsService {
  final AnimalsAPi animalsApi = AnimalsAPi();

  List<Animal> animals = [];

  Future<void> getAnimals() async {
    try {
      animals = await animalsApi.getAnimals();
    } catch (error) {
      print('Error loading animals $error');
    }
  }
}
