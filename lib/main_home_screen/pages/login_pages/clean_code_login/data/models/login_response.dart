// lib/main_home_screen/pages/login_pages/clean_code_login/data/models/login_response.dart

class LoginResponse {
  final String phoneNumber;
  final String hash;

  LoginResponse({required this.phoneNumber, required this.hash});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      phoneNumber: json['phone_number'],
      hash: json['hash'],
    );
  }
}
