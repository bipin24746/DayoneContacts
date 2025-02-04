import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/entity/login_entity.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  // Assuming you have a method for request OTP or login
  Future<LoginEntity> call(String phoneNumber) {
    return loginRepository.requestOtp(phoneNumber);
  }
}
