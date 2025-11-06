import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  static const String baseUrl = 'https://rickandmortyapi.com/api/character';

  static Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];
      return results.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('Error al cargar personajes (${response.statusCode})');
    }
  }
}
