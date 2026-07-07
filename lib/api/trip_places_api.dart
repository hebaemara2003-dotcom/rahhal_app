import 'dart:convert';
import 'package:http/http.dart' as http;

class TripDetailsService {
  static const String baseUrl =
      "https://implant-liberty-transfer.ngrok-free.dev/api/Trips";

  static const String token =
      "حطي التوكن هنا";

  Future<Map<String, dynamic>> getTripDetails(int tripId) async {
    final response = await http.get(
      Uri.parse("$baseUrl/$tripId"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load trip");
    }
  }
}