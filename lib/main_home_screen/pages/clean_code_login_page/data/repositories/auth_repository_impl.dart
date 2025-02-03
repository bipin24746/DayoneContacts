import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/data/api/auth_service.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/entities/auth_entity.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<AuthEntity> sendOtp(String phone) async {
    final response = await _authService.sendOtp(phone);
    return AuthEntity.fromJson(response.data);
  }

  @override
  Future<AuthEntity> verifyOtp(String hash, String otp, String phone) async {
    final response = await _authService.verifyOtp(hash, otp, phone);
    return AuthEntity.fromJson(response.data);
  }
}