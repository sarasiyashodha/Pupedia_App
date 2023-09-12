import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  final endpoint = "https://dog.ceo/api/breeds/list/all";

  Future<void> getData() async {
    Response response = await get(Uri.parse(endpoint));

    if(response.statusCode == 200) {
      Map<String, dynamic> body  = jsonDecode(response.body);
      print(body['message']);

    }else{
      throw Exception(response.statusCode);
    }
  }
}