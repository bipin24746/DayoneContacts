class LoginResponse {
  final bool success;
  final String message;
  final Data? data;

  LoginResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  final String hash;
  final String otp;
  final String phone;

  Data({
    required this.hash,
    required this.otp,
    required this.phone,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      hash: json['hash'] as String,
      otp: json['otp'] as String,
      phone: json['phone'] as String,
    );
  }
}