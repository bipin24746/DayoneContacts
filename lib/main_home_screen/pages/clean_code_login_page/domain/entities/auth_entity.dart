class AuthEntity {
  final bool success;
  final String message;
  final AuthDataEntity data;

  AuthEntity({
    required this.success,
    required this.message,
    required this.data,
  });
}

class AuthDataEntity {
  final String hash;
  final String otp;
  final String phone;
  final String? accessToken;
  final String? refreshToken;

  AuthDataEntity({
    required this.hash,
    required this.otp,
    required this.phone,
    this.accessToken,
    this.refreshToken,
  });
}