import 'dart:convert';
import 'package:articulos_examen/screen/articles.dart';
import 'package:articulos_examen/screen/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> login(
    String username,
    String password,
    BuildContext context,
  ) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("http://192.168.20.71:4000/auth/login");
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

      //  token en SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

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
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    return token != null;
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
