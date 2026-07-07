import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/token_storage.dart';

Future<List<dynamic>> getPlaces() async {
  var url = Uri.parse(
    "https://implant-liberty-transfer.ngrok-free.dev/api/Places",
  );

  String? token = await TokenStorage.getToken();

  if (token == null) {
    throw Exception("User is not logged in");
  }

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
    final Map<String, dynamic> json = jsonDecode(response.body);
    return json["data"];
  } else {
    throw Exception("Failed to load places");
  }
}