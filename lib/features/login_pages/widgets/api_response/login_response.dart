class LoginResponse {
  bool success;
  String message;
  Data data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class Data {
  String hash;
  String otp;
  String phone;

  Data({
    required this.hash,
    required this.otp,
    required this.phone,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      hash: json['hash'],
      otp: json['otp'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'otp': otp,
      'phone': phone,
    };
  }
}