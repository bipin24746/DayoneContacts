import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/core/errors/failure.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/data/datasources/login_remote_data_source.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/entity/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import 'package:device_info_plus/device_info_plus.dart'; // Add this for deviceId

import '../models/login_response.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource = LoginRemoteDataSourceImpl();

  @override
  Future<Either<Failure, LoginResponse>> login(String phoneNumber) async {
    try {
      final deviceId = await _getDeviceId(); // Get deviceId asynchronously
      final loginResponse = await remoteDataSource.requestOtp(phoneNumber, deviceId);
      return Right(loginResponse);
    } catch (e) {
      return Left(ServerFailure(message: e.toString(), errorMessage: ''));
    }
  }

  @override
  Future<LoginEntity> requestOtp(String phoneNumber) async {
    try {
      final deviceId = await _getDeviceId(); // Get deviceId asynchronously
      final otpResponse = await remoteDataSource.requestOtp(phoneNumber, deviceId);

      // Convert the OTP response to a LoginEntity
      return LoginEntity(
        hash: otpResponse.hash,
        otp: otpResponse.otp,
        phone: otpResponse.phoneNumber,
        deviceId: otpResponse.deviceId,
        fcmToken: otpResponse.fcmToken,
        deviceType: otpResponse.deviceType,
        phoneNumber: otpResponse.phoneNumber,
      );
    } catch (e) {
      throw ServerFailure(message: e.toString(), errorMessage: '');
    }
  }

  // Method to get deviceId
  Future<String> _getDeviceId() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final androidInfo = await deviceInfoPlugin.androidInfo; // Assuming Android device
    return androidInfo.id; // Returns unique device ID
  }
}
