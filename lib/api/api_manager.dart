// https://implant-liberty-transfer.ngrok-free.dev/api/Authentication/login
import '../model_api/login/auth_response.dart';
import 'api_constants.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'end_points.dart';
class ApiManager{
  static Future<AuthResponse> getAuth()async {
    Uri url = Uri.https(ApiConstants.baseUrl,
        EndPoints.authenticationApi,
       );
    // SourseResponse.fromJson( jsonDecode(response.body));
    try {
      var response = await http.get(url);
      var responseBody = response.body;

      ///String
      /// String => json
      var json = jsonDecode(responseBody);

      /// json
      /// json => object
      return AuthResponse.fromJson(json);
    }
    catch (e) {
      rethrow;
    }
  }
  // static Future<AuthResponse> getReset()async {
  //   Uri url = Uri.https(ApiConstants.baseUrl,
  //     EndPoints.resetPasswordApi,
  //   );
  //   // SourseResponse.fromJson( jsonDecode(response.body));
  //   try {
  //     var response = await http.get(url);
  //     var responseBody = response.body;
  //
  //     ///String
  //     /// String => json
  //     var json = jsonDecode(responseBody);
  //
  //     /// json
  //     /// json => object
  //     return AuthResponse.fromJson(json);
  //   }
  //   catch (e) {
  //     rethrow;
  //   }
  // }
  }