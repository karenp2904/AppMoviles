import 'dart:convert';
import 'package:articulos_examen/screen/articles.dart';
import 'package:articulos_examen/screen/login.dart';
import 'package:articulos_examen/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  
  final url = Uri.parse("http://192.168.20.71:4000/auth/login");

  Future<void> login(
    String username,
    String password,
    BuildContext context,
  ) async {
    isLoading = true;
    notifyListeners();


    
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    isLoading = false;
    notifyListeners();

    final data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      final String token = data["token"];
      final int userId = data["user"]["id"];
      print(userId);

      //  token en SharedPreferences
      await SharedPrefs.saveToken(token);
      await SharedPrefs.saveUserId(userId);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ArticlesView()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(data["message"])));
    }
  }

  Future<bool> checkLoginStatus() async {
    final token = await SharedPrefs.getToken();
    return token != null;
  }



  Future<void> logout(BuildContext context) async {
    await SharedPrefs.clearToken();
    print('Token eliminado');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
