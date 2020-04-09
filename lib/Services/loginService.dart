import 'dart:convert';

import 'package:play_layout/Models/token.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<Token> doAuth(String email, String password) async {
    try {
      final response = await http.post('http://192.168.0.7:666/api/v1/login',
          body: {'email': email, 'password': password});

      if (response.statusCode != 200) {
        throw new Exception(response.body);
      }

      return Token.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  Future<String> saveToken(String token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      return token;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> retriveToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    } catch (e) {
      rethrow;
    }
  }
}
