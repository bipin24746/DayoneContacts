import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/data/models/login_response.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/data/repositories/login_repository_impl.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/domain/domain_repositories/login_repository.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/domain/entity/login_entity.dart';


abstract class SendOtpUseCase {
  Future<LoginResponse> call(String phoneNumber);
}
class SendOtpUseCaseImpl implements SendOtpUseCase {
  final LoginRepository repository;

  SendOtpUseCaseImpl(this.repository);

  @override
  Future<LoginResponse> call(String phoneNumber) {
    return repository.sendOtp(phoneNumber);
  }
}
