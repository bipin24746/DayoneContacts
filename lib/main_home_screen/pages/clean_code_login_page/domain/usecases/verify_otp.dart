

import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/entities/auth_entity.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/repositories/auth_repository.dart';

class VerifyOtp {
  final AuthRepository repository;

  VerifyOtp(this.repository);

  Future<AuthEntity> call(String hash, String otp, String phone) async {
    return repository.verifyOtp(hash, otp, phone);
  }
}