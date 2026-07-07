import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model_api/basket/basket_response.dart';
import '../utils/token_storage.dart';

class BasketService {
  static const String baseUrl =
      "https://implant-liberty-transfer.ngrok-free.dev/api/Basket";


  Future<BasketResponse> getBasket() async {
    String? token = await TokenStorage.getToken();

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      return BasketResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Failed to load basket");
    }
  }
}