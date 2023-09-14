import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  final baseUrl = "https://dog.ceo/api";

  Future<List<String>> fetchDogBreeds() async {
    Response response = await get(Uri.parse("$baseUrl/breeds/list/all"),
    );

    if(response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> breeds = data['message'];

      return breeds.keys.toList();

    }else{
      throw Exception(response.statusCode);
    }
  }

  Future<String> fetchDogImageByBreed(String breedName) async {
    final response = await get(
      Uri.parse("$baseUrl/breed/$breedName/images/random"),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final imageUrl = data['message'];
      return imageUrl;
    } else {
      throw Exception('Failed to load dog image for $breedName');
    }
  }
}