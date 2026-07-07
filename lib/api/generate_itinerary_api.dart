import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model_api/generate_itinerary/generate_itinerary_request.dart';
import '../model_api/generate_itinerary/generate_itinerary_response.dart';
import '../utils/token_storage.dart';

Future<GenerateItineraryResponse?> generateItinerary(
    GenerateItineraryRequest request) async {

  String? token = await TokenStorage.getToken();

  final url = Uri.parse(
      "https://implant-liberty-transfer.ngrok-free.dev/api/AiRecognition/generate-itinerary");

  final response = await http.post(
    url,
    headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    },
    body: jsonEncode(request.toJson()),
  );

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    return GenerateItineraryResponse.fromJson(
        jsonDecode(response.body));
  }

  return null;
}