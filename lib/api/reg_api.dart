import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_constants.dart';
import 'end_points.dart';

Future<http.Response> register({
  required String fullName,
  required String email,
  required String password,
  required bool isEgyptian,
  required bool isStudent,
}) async {
  Uri url = Uri.https(
    ApiConstants.baseUrl,
    EndPoints.regPasswordApi,
  );

  var response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "fullName": fullName,
      "email": email,
      "password": password,
      "isEgyptian": isEgyptian,
      "isStudent": isStudent,
    }),
  );

  print(response.statusCode);
  print(response.body);

  return response;
}