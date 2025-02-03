import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/data/models/login_response.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  // Constructor
  LoginUseCase(this.authRepository);

  // Login method
  Future<Either<String, LoginResponse>> login(String phoneNumber) async {
    return await authRepository.login(phoneNumber);
  }
}
