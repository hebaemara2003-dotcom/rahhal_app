import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/token_storage.dart'; // عدلي المسار حسب مكان الملف

Future<http.Response> login({
  required String email,
  required String password,
}) async {
  var response = await http.post(
    Uri.parse(
      "https://implant-liberty-transfer.ngrok-free.dev/api/Authentication/login",
    ),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "email": email,
      "password": password,
    }),
  );

  print(response.statusCode);
  print(response.body);

  // لو تسجيل الدخول نجح خزني الـ Token
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    final token = data["data"]["token"];

    await TokenStorage.saveToken(token);
  }

  return response;
}