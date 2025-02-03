import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<Response> sendOtp(String phone) async {
    final url = 'https://housing-stagingserver.aitc.ai/api/v1/client/auth';
    return _dio.post(url, data: {'contact': phone});
  }

  Future<Response> verifyOtp(String hash, String otp, String phone) async {
    final url = 'https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify';
    return _dio.post(url, data: {
      'hash': hash,
      'otp': otp,
      'phone': phone,
      'deviceType': 'android',
    });
  }
}