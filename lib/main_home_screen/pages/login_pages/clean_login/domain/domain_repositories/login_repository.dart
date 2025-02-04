import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/data/models/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> sendOtp(String phoneNumber);
}
