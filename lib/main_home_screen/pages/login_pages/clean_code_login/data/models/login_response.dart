class LoginResponse {
  final String phoneNumber;
  final String hash;
  final String otp;
  final String phone;
  final String deviceId;
  final String fcmToken;
  final String deviceType;
  final String message; // Message field for status/error message

  LoginResponse({
    required this.phoneNumber,
    required this.hash,
    required this.otp,
    required this.phone,
    required this.deviceId,
    required this.fcmToken,
    required this.deviceType,
    required this.message,
  });

  // From JSON mapping
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      phoneNumber: json['phone_number'] ?? '',
      hash: json['hash'] ?? '',
      otp: json['otp'] ?? '',
      phone: json['phone'] ?? '',
      deviceId: json['device_id'] ?? '',
      fcmToken: json['fcm_token'] ?? '',
      deviceType: json['device_type'] ?? '',
      message: json['message'] ?? '', // Including message here for responses
    );
  }

  // To JSON mapping
  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber,
      'hash': hash,
      'otp': otp,
      'phone': phone,
      'device_id': deviceId,
      'fcm_token': fcmToken,
      'device_type': deviceType,
      'message': message,
    };
  }
}
