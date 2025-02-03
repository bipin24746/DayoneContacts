import 'dart:convert';

class OtpResponse {
  final String message;
  final String token; // This might be needed for authentication

  OtpResponse({required this.message, required this.token});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      message: json['message'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
    };
  }
}
