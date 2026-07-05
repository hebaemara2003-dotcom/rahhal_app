import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/token_storage.dart';
import 'api_constants.dart';
import 'end_points.dart';

Future<List<dynamic>> getPopularTrips() async {
  String? token = await TokenStorage.getToken();

  if (token == null) {
    throw Exception("User not logged in");
  }

  Uri url = Uri.https(
    ApiConstants.baseUrl,
    EndPoints.popularTripApi,
  );

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
  } else if (response.statusCode == 401) {
    throw Exception("User not authenticated");
  } else {
    throw Exception("Failed to load popular trips");
  }
}