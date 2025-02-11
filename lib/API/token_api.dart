import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TokenAPi {
  Future<String> getToken() async {
    String url = 'https://api.petfinder.com/v2/oauth2/token';
    Map<String, String> body = {
      "grant_type": "client_credentials",
      "client_id": dotenv.env['CLIENT_ID'].toString(),
      "client_secret": dotenv.env['CLIENT_SECRET'].toString()
    };

    final response = await http.post(Uri.parse(url), body: body);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      String json = data['access_token'].toString();
      return json;
    } else {
      print('Failed to load token');
      throw Exception('Failed to load token');
    }
  }
}
