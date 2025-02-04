import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/entity/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> requestOtp(String phoneNumber);
}