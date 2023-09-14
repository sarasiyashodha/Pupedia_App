import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  final baseUrl = "https://dog.ceo/api";

  Future<List<String>> fetchDogBreeds() async {
    Response response1 = await get(
      Uri.parse("$baseUrl/breeds/list/all"),
    );

    if (response1.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response1.body);
      final Map<String, dynamic> breeds = data['message'];
      return breeds.keys.toList();
    } else {
      throw Exception('Failed to fetch dog breeds: ${response1.statusCode}');
    }
  }

  Future<String> fetchDogImageByBreed(String breedName) async {
    final response2 = await get(
      Uri.parse("$baseUrl/breed/$breedName/images/random"),
    );

    if (response2.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response2.body);
      final imageUrl = data['message'];
      return imageUrl;
    } else {
      throw Exception(
          'Failed to fetch dog image for $breedName: ${response2.statusCode}');
    }
  }
}
