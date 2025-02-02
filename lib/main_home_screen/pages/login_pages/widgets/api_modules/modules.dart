import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> login(String contact) async {
    try {
      Response response = await _dio.post(
          'https://housing-stagingserver.aitc.ai/api/v1/client/auth',
          data: {
            // "email" : email
            "contact": contact
          });

      if (response.statusCode == 200) {
        log('response of mobile number : ${response.data}');
        return response.data;
      } else {
        throw Exception("Failed to send OTP");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            "Error: ${e.response?.data['message'] ?? 'Unknown error'}");
      } else {
        throw Exception("Connection failed : ${e.message}");
      }
    }
  }
}

// import 'package:dio/dio.dart';
//
// class ApiService {
//   final Dio _dio = Dio();
//
//   Future<Map<String, dynamic>> login(String contact) async {
//     const String url = "https://housing-stagingserver.aitc.ai/api/v1/client/auth";
//
//     try {
//       final response = await _dio.post(
//         url,
//         data: {"contact": contact},
//       );
//
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception("Failed to send OTP");
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         throw Exception("Error: ${e.response?.data['message'] ?? 'Unknown error'}");
//       } else {
//         throw Exception("Connection failed: ${e.message}");
//       }
//     }
//   }
// }
