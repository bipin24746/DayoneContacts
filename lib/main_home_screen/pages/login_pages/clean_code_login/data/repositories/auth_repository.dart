import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/core/network/api_client.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/data/models/login_response.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient apiClient;

  AuthRepositoryImpl({required this.apiClient});

  @override
  Future<Either<String, LoginResponse>> login(String phoneNumber) async {
    try {
      final response = await apiClient.postRequest(
        '/auth',
        {'contact': phoneNumber},
      );

      final loginResponse = LoginResponse.fromJson(response);
      return Right(loginResponse);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, LoginResponse>> verifyOtp(String phoneNumber, String otp, String hash) async {
    try {
      final response = await apiClient.postRequest(
        '/otp/verify',
        {'phone_number': phoneNumber, 'otp': otp, 'hash': hash},
      );

      final otpResponse = LoginResponse.fromJson(response);
      return Right(otpResponse);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
