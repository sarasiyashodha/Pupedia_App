import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  final baseUrl = "https://dog.ceo/api";

  //fetching a list of dog breeds from dog breed API.
  Future<List<String>> fetchDogBreeds() async {
    Response response1 = await get(
      Uri.parse("$baseUrl/breeds/list/all"),
    );

    if (response1.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response1.body);
      final Map<String, dynamic> breeds = data['message'];
      return breeds.keys.toList(); //convert keys of breeds to a list
    } else {
      throw Exception('Failed to fetch dog breeds: ${response1.statusCode}');
    }
  }

  //fetching a random dog image from dog image API for a given breed.
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
