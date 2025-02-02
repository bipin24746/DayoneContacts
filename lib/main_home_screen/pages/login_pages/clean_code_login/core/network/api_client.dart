import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
      : dio = Dio(BaseOptions(
    baseUrl: "https://housing-stagingserver.aitc.ai/api/v1/client", // Set the base URL
    connectTimeout: const Duration(seconds: 10), // Set connection timeout
    receiveTimeout: const Duration(seconds: 10), // Set response timeout
  ));

  /// Generic method to send a POST request
  Future<Map<String, dynamic>> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(endpoint, data: data);

      // Ensure the response is a Map<String, dynamic>
      if (response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        throw Exception("Invalid response format");
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Something went wrong");
    }
  }
}
