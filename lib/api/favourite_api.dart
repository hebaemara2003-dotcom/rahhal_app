import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model_api/favorite/favourite_response.dart';
import '../utils/token_storage.dart';

Future<List<FavouriteResponse>> getFavoritePlaces() async {
  String? token = await TokenStorage.getToken();

  final url = Uri.parse(
      "https://implant-liberty-transfer.ngrok-free.dev/api/Places/favorites");

  final response = await http.get(
    url,
    headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    },
  );

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);

    return data
        .map((e) => FavouriteResponse.fromJson(e))
        .toList();
  }

  return [];
}