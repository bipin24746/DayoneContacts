

import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> sendOtp(String phone);
  Future<AuthEntity> verifyOtp(String hash, String otp, String phone);
}