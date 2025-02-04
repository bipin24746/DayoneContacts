// lib/main_home_screen/pages/login_pages/clean_code_login/core/network/api_client.dart

import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  // Define the login method
  Future<Map<String, dynamic>> login(String phoneNumber) async {
    try {
      final response = await _dio.post(
        'https://housing-stagingserver.aitc.ai/api/v1/client/auth', // Replace with your actual API endpoint
        data: {'phone_number': phoneNumber},
      );

      // Check the response status and return data
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load login data');
      }
    } catch (e) {
      throw Exception('Error logging in: ${e.toString()}');
    }
  }

  // Example of another method to perform a POST request
  Future<Map<String, dynamic>> postRequest(String endpoint, Map<String, dynamic> data) async {
    final response = await _dio.post(endpoint, data: data);
    return response.data;
  }
}
