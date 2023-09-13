import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  final endpoint = "https://dog.ceo/api/breeds/list/all";

  Future<List<String>> getData() async {
    Response response = await get(Uri.parse(endpoint));

    if(response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> breeds = data['message'];

      return breeds.keys.toList();

    }else{
      throw Exception(response.statusCode);
    }
  }
}