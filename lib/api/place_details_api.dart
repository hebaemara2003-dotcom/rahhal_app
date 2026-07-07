import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model_api/place_details/place_details_response.dart';
import '../utils/token_storage.dart';


class PlaceDetailsService {
  static const String baseUrl =
      "https://implant-liberty-transfer.ngrok-free.dev/api/Places";


  Future<PlaceDetailsResponse> getPlace(int id) async {
    String? token = await TokenStorage.getToken();

    final response = await http.get(
      Uri.parse("$baseUrl/$id"),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return PlaceDetailsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load place");
    }
  }
}