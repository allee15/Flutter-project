import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKeys { token }

class SharedPreferencesService {
  Future<void> setString(SharedPreferencesKeys key, String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key.name, value);
  }

  Future<String?> getString(SharedPreferencesKeys key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key.name);
  }
}
