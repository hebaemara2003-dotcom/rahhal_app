import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/token_storage.dart';
import 'api_constants.dart';

Future<Map<String, dynamic>> getProfile() async {
  Uri url = Uri.https(
    ApiConstants.baseUrl,
    "/api/User/profile",
  );

  String? token = await TokenStorage.getToken();

  var response = await http.get(
    url,
    headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    },
  );

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Failed to load profile");
  }
}