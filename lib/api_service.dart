import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  final endpoint = "https://dog.ceo/api/breed/bulldog/images";

  Future<Map<String, dynamic>> getData() async {
    Response response = await get(Uri.parse(endpoint));

    if(response.statusCode == 200) {
      Map<String, dynamic> body  = jsonDecode(response.body);
      Map<String, dynamic> message  = body['message'];
      return message;

    }else{
      throw Exception(response.statusCode);
    }
  }
}