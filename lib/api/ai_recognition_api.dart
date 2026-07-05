import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rahhal_app/api/image_recognition.dart';
import 'package:rahhal_app/model_api/image_recognition/image_recognition_response.dart';


Future<ImageRecognitionResponse> recognizeImage(
    File imageFile,
    String token,
    ) async {
  var request = http.MultipartRequest(
    "POST",
    Uri.parse(
      "https://implant-liberty-transfer.ngrok-free.dev/api/AiRecognition/recognize-image",
    ),
  );

  request.headers.addAll({
    "Authorization": "Bearer $token",
  });

  request.files.add(
    await http.MultipartFile.fromPath(
      "image",
      imageFile.path,
    ),
  );

  var response = await request.send();

  var body = await response.stream.bytesToString();

  print("Status Code : ${response.statusCode}");
  print(body);

  if (response.statusCode == 200) {
    return ImageRecognitionResponse.fromJson(
      jsonDecode(body),
    );
  } else {
    throw Exception("Recognition Failed");
  }
}