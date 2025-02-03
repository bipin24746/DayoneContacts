import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/data/models/auth_response_model.dart';
import 'package:dio/dio.dart';


abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> sendOtp(String phone);
  Future<AuthResponseModel> verifyOtp(String hash, String otp, String phone);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<AuthResponseModel> sendOtp(String phone) async {
    final response = await dio.post(
      'https://housing-stagingserver.aitc.ai/api/v1/client/auth',
      data: {'contact': phone},
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> verifyOtp(String hash, String otp, String phone) async {
    final response = await dio.post(
      'https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify',
      data: {
        'hash': hash,
        'otp': otp,
        'phone': phone,
        'deviceType': 'android',
      },
    );
    return AuthResponseModel.fromJson(response.data);
  }
}