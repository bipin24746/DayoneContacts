class LoginResponse {
  final bool success;
  final Data data; // Assuming response data is nested in a Data object

  LoginResponse({required this.success, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String otp;
  final String hash;

  Data({required this.otp, required this.hash});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      otp: json['otp'],
      hash: json['hash'],
    );
  }
}
