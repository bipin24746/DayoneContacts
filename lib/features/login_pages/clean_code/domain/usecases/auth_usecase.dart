import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/core/errors/failures.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/core/usecases/use_cases.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/login_entity/auth_entity.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/login_entity/auth_response_entity.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/repositories/auth_repository.dart';


class AuthUseCase implements UseCase<AuthResponseEntity, AuthEntity> {
  final AuthRepository authRepository;

  const AuthUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, AuthResponseEntity>> call(AuthEntity params) async {
    // Call the repository method and pass necessary parameters from AuthEntity.
    return await authRepository.performAuth(
      phoneNumber: params.phoneNo,
      // Pass other parameters like OTP or device information if required.
    );
  }
}
