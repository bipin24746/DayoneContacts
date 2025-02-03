import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/data/models/login_response.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/repositories/auth_repository.dart';

class OtpUseCase {
  final AuthRepository repository;

  OtpUseCase(this.repository);

  Future<Either<String, LoginResponse>> verifyOtp(String phone, String otp, String hash) {
    return repository.verifyOtp(phone, otp, hash);
  }
}
