import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/animals_service.dart';
import 'package:flutter_application_1/Model/animal_details.dart';

class AnimalDetailsViewModel extends ChangeNotifier {
  final AnimalsService _animalsService = AnimalsService();

  bool isLoading = false;
  AnimalDetails? animalDetails;
  String? errorMessage;

  AnimalDetailsViewModel(int animalId) {
    getAnimalDetails(animalId);
  }

  Future<void> getAnimalDetails(int animalId) async {
    try {
      isLoading = true;
      notifyListeners();
      await _animalsService.getAnimalDetails(animalId);
      animalDetails = _animalsService.animalDetails;
      errorMessage = null;
    } catch (error) {
      errorMessage = 'Error loading animal details';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
