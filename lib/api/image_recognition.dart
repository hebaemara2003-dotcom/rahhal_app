import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils/token_storage.dart';

class ImageRecognition {
  static const String url =
      "https://implant-liberty-transfer.ngrok-free.dev/api/AiRecognition/recognize-image";

  static Future<Map<String, dynamic>?> recognizeImage(File image) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      String? token = await TokenStorage.getToken();


      request.headers["Authorization"] = "Bearer $token";

      request.files.add(
        await http.MultipartFile.fromPath(
          "image", // مهم: لو backend اسم مختلف قوليلي
          image.path,
        ),
      );

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print(responseBody);

      if (response.statusCode == 200) {
        return json.decode(responseBody);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}