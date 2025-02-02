import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/core/network/api_client.dart';


class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  /// Login request using phone number
  /// Returns → Either<String, Map<String, dynamic>>
  Future<Either<String, Map<String, dynamic>>> login(String phoneNumber) async {
    try {
      final response = await apiClient.postRequest(
        '/auth', // Automatically appends to base URL
        {'phone_number': phoneNumber},
      );
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// OTP verification request
  Future<Either<String, Map<String, dynamic>>> verifyOtp(String phoneNumber, String otp) async {
    try {
      final response = await apiClient.postRequest(
        '/otp/verify',
        {'phone_number': phoneNumber, 'otp': otp},
      );
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
