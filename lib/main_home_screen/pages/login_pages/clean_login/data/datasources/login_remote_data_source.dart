import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/data/models/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> sendOtp(String phoneNumber);
}
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginResponse> sendOtp(String phoneNumber) async {
    try {
      final response = await dio.post('/sendOtp', data: {'phone': phoneNumber});

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data); // assuming this method parses the response data
      } else {
        throw Exception("Failed to send OTP");
      }
    } catch (e) {
      throw Exception("Error sending OTP: $e");
    }
  }
}

