class AuthResponseModel {
  final bool success;
  final String message;
  final AuthDataModel data;

  AuthResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      success: json['success'],
      message: json['message'],
      data: AuthDataModel.fromJson(json['data']),
    );
  }
}

class AuthDataModel {
  final String hash;
  final String otp;
  final String phone;
  final String? accessToken;
  final String? refreshToken;

  AuthDataModel({
    required this.hash,
    required this.otp,
    required this.phone,
    this.accessToken,
    this.refreshToken,
  });

  factory AuthDataModel.fromJson(Map<String, dynamic> json) {
    return AuthDataModel(
      hash: json['hash'],
      otp: json['otp'],
      phone: json['phone'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}