import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/animal.dart';
import 'package:flutter_application_1/Service/animals_service.dart';

class HomeViewmodel extends ChangeNotifier {
  final AnimalsService _animalsService = AnimalsService();

  List<Animal> animals = [];
  bool isLoading = false;
  String? errorMessage;

  HomeViewmodel() {
    getAnimals();
  }

  Future<void> getAnimals() async {
    try {
      isLoading = true;
      notifyListeners();
      await _animalsService.getAnimals();
      animals = _animalsService.animals;
      errorMessage = null;
    } catch (error) {
      errorMessage = 'Error loading animals';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
