import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/data/models/login_response.dart';

abstract class AuthRepository {
  Future<Either<String, LoginResponse>> login(String phoneNumber);
  Future<Either<String, LoginResponse>> verifyOtp(String phoneNumber, String otp, String hash);
}
