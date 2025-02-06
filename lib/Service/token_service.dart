import 'package:flutter_application_1/API/token_api.dart';
import 'package:flutter_application_1/Service/shared_preferences_service.dart';

class TokenService {
  final TokenAPi tokenApi = TokenAPi();
  final SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  Future<void> getToken() async {
    try {
      var token = await tokenApi.getToken();
      sharedPreferencesService.setString(SharedPreferencesKeys.token, token);
    } catch (error) {
      print('Error loading token $error');
      throw Exception('Failed to load token');
    }
  }
}
