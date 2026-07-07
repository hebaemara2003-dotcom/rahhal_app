import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/token_storage.dart';

Future<String> sendMessageToAI(String message) async {
  String? token = await TokenStorage.getToken();

  if (token == null) {
    throw Exception("User not logged in");
  }

  final url = Uri.parse(
    "https://implant-liberty-transfer.ngrok-free.dev/api/AiRecognition/chat",
  );

  final response = await http.post(
    url,
    headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "message": message,
    }),
  );

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    return data["data"];
  } else {
    throw Exception("Failed to get AI response");
  }
}