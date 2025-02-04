// lib/main_home_screen/pages/login_pages/clean_code_login/domain/entity/login_entity.dart

class LoginEntity {
  final String phoneNumber;
  final String hash;
  final String otp;
  final String phone;
  final String deviceId;
  final String fcmToken;
  final String deviceType;

  LoginEntity({
    required this.phoneNumber,
    required this.hash,
    required this.otp,
    required this.phone,
    required this.deviceId,
    required this.fcmToken,
    required this.deviceType,
  });
}
