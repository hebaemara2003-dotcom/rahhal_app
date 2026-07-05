import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/token_storage.dart';

class PlacesApi {

  Future<dynamic> generateTripItinerary({required Map<String, dynamic> requestBody}) async {
    var url = Uri.parse(
      "https://implant-liberty-transfer.ngrok-free.dev/api/AiRecognition/generate-itinerary",
    );

    //String? token = await TokenStorage.getToken();
    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiRW5hcyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6IkVuYXNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIzIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImV4cCI6MTc4NTg0NjAyOCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzAyMi8iLCJhdWQiOiJUcmF2ZWxBcHBVc2VycyJ9._ahZr5JOU8hQffYfUjjjgCUdP4PCbQH3DqvzLvx6hVI";

    var response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(requestBody),
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

  static Future<String?> sendAssistantMessage({required String message}) async {
    var url = Uri.parse("https://implant-liberty-transfer.ngrok-free.dev/api/AiRecognition/chat");

    String currentToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiRW5hcyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6IkVuYXNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIzIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImV4cCI6MTc4NTg0NjAyOCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzAyMi8iLCJhdWQiOiJUcmF2ZWxBcHBVc2VycyJ9._ahZr5JOU8hQffYfUjjjgCUdP4PCbQH3DqvzLvx6hVI";

    var requestBody = {
      "message": message
    };

    try {
      print("جاري إرسال الرسالة إلى الـ AI Assistant...");
      var response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $currentToken",
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      print("Assistant Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          return jsonResponse['data']?.toString();
        }
      }
      return null;
    } catch (e) {
      print("خطأ في الاتصال بالـ Assistant: $e");
      return null;
    }
  }
}
