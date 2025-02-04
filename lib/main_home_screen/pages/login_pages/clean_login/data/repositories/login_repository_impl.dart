// login_repository_impl.dart
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/data/models/login_response.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/widgets/api_response/otp_response.dart';
import 'package:dio/dio.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/data/datasources/login_remote_data_source.dart';

class LoginRepositoryImpl {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  Future<LoginResponse> sendOtp(String phoneNumber) async {
    // Assuming the remote data source is responsible for sending OTP
    final otpResponse = await remoteDataSource.sendOtp(phoneNumber);
    return otpResponse; // Return the OTP response
  }
}
