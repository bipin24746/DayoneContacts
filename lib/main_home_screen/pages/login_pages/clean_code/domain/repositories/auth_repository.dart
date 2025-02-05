import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/core/errors/failures.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/entity/login_entity/auth_entity.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/entity/login_entity/auth_response_entity.dart';


abstract class AuthRepository {
  Future<Either<Failure, AuthResponseEntity>> performAuth({
    required String phoneNumber,
    // required int countryCode,
  });
}
