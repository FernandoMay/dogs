import 'dart:convert';
import 'package:dogs/domain/models/dog.dart';
import 'package:http/http.dart' as http;

class DogsApiService {
  static const String apiUrl = 'https://jsonblob.com/api/1151549092634943488';

  Future<List<Dog>> fetchDogs() async {
    final response = await http.get(Uri.parse(apiUrl));
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Dog.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load dogs');
    }
  }
}