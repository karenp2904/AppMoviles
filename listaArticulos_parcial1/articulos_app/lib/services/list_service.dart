import 'dart:convert';
import 'package:http/http.dart' as http;

class ArticleService {
  final String baseUrl = 'http://192.168.20.71:4000/articles';

  Future<List<Map<String, dynamic>>> getArticles() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((article) => article as Map<String, dynamic>).toList();
      } else {
        throw Exception('Error al obtener artículos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  Future<void> addFavorite(int userId, int articleId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/favorites'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'userId': userId, 'articleId': articleId}),
      );
      if (response.statusCode != 201) {
        throw Exception('Error al agregar favorito: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getFavorites(int userId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/favorites/$userId'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((article) => article as Map<String, dynamic>).toList();
      } else {
        throw Exception('Error al obtener favoritos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
