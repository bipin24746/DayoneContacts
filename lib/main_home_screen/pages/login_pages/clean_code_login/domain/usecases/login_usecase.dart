import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase{
  final AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Either<String, Map<String, dynamic>>> call(LoginParams params) async{
    return await authRepository.login(params.phoneNumber);
  }
}

class LoginParams extends Equatable{
  final String phoneNumber;
  const LoginParams(this.phoneNumber);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}