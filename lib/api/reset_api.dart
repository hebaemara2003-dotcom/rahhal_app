import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> forgotPassword({
  required String email,
}) async {
  var response = await http.post(
    Uri.parse(
      "https://implant-liberty-transfer.ngrok-free.dev/api/Authentication/forgot-password",
    ),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "email": email,
    }),
  );

  print(response.statusCode);
  print(response.body);

  return response;
}


Future<http.Response> resetPassword({
  required String email,
  required String token,
  required String newPassword,
}) async {

  var response = await http.post(
    Uri.parse(
      "https://implant-liberty-transfer.ngrok-free.dev/api/Authentication/reset-password",
    ),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "email": email,
      "token": token,
      "newPassword": newPassword,
    }),
  );

  print(response.statusCode);
  print(response.body);

  return response;
}