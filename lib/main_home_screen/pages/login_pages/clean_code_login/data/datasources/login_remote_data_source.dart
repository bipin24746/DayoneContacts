import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/core/errors/failure.dart';
import 'package:dio/dio.dart';
import '../models/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> requestOtp(String phoneNumber, String deviceId); // Accept deviceId here
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<LoginResponse> requestOtp(String phoneNumber, String deviceId) async {
    try {
      final response = await dio.post(
        "https://housing-stagingserver.aitc.ai/api/v1/client/auth",
        data: {
          'phone': phoneNumber,
          'deviceId': deviceId, // Pass deviceId here
        },
      );

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data); // Return a valid response
      } else {
        throw ServerFailure(message: "Bad request: ${response.statusCode}", errorMessage: '');
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          print('Error response: ${e.response?.data}');
          // Handling the nullable string and providing a fallback message if it's null
          throw ServerFailure(message: e.response?.data['message'] ?? 'Unknown error', errorMessage: '');
        } else {
          print('Error message: ${e.message}');
          // Handling the nullable string and providing a fallback message if it's null
          throw ServerFailure(message: e.message ?? 'Unknown error occurred', errorMessage: '');
        }
      } else {
        throw ServerFailure(message: e.toString(), errorMessage: '');
      }
    }
  }
}
