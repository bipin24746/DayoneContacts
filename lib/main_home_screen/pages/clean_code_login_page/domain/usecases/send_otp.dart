
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/entities/auth_entity.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/repositories/auth_repository.dart';

class SendOtp {
  final AuthRepository repository;

  SendOtp(this.repository);

  Future<AuthEntity> call(String phone) async {
    return repository.sendOtp(phone);
  }
}