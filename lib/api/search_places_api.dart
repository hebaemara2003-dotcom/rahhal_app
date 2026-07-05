import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/token_storage.dart';
import 'api_constants.dart';

Future<List> searchPlaces(String keyword) async {
  String? token = await TokenStorage.getToken();

  Uri url = Uri.https(
    ApiConstants.baseUrl,
    "/api/Places/Search",
    {
      "keyword": keyword,
    },
  );

  print("Searching: $keyword");
  print(url);
  print(url.toString());

  print("TOKEN = $token");

  var response = await http.get(
    url,
    headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    },
  );

  print("Status Code: ${response.statusCode}");
  print("Body: ${response.body}");

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Failed to search places");
  }
}