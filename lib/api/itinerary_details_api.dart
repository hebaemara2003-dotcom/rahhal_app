import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model_api/itnerary_details/itnerary_details_response.dart';
import '../utils/token_storage.dart';

Future<ItneraryDetailsResponse?> getTripDetails(int tripId) async {
  String? token = await TokenStorage.getToken();

  final url = Uri.parse(
      "https://implant-liberty-transfer.ngrok-free.dev/api/Trips/$tripId");

  final response = await http.get(
    url,
    headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    },
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return ItneraryDetailsResponse.fromJson(json);
  }

  return null;
}