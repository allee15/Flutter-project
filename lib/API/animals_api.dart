import 'dart:convert';
import 'package:flutter_application_1/Model/animal.dart';
import 'package:flutter_application_1/Service/shared_preferences_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/Model/animal_details.dart';

class AnimalsAPi {
  final SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  Future<List<Animal>> getAnimals() async {
    String? token =
        await sharedPreferencesService.getString(SharedPreferencesKeys.token);

    if (token == null) {
      throw Exception("Token is not available");
    }

    Map<String, String> header = {"Authorization": "Bearer $token"};
    String url = 'https://api.petfinder.com/v2/animals';

    final response = await http.get(Uri.parse(url), headers: header);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> animalsJson = data['animals'];
      return animalsJson.map((json) => Animal.fromJson(json)).toList();
    } else {
      print('Failed to load animals');
      throw Exception('Failed to load animals');
    }
  }

  Future<AnimalDetails> getAnimalDetails(int animalId) async {
    String? token =
        await sharedPreferencesService.getString(SharedPreferencesKeys.token);

    if (token == null) {
      throw Exception("Token is not available");
    }

    Map<String, String> header = {"Authorization": "Bearer $token"};
    String url = 'https://api.petfinder.com/v2/animals/$animalId';

    final response = await http.get(Uri.parse(url), headers: header);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      dynamic animalDetailsJson = data['animal'];
      return AnimalDetails.fromJson(animalDetailsJson);
    } else {
      print('Failed to load animal details');
      throw Exception('Failed to load animal details');
    }
  }
}
