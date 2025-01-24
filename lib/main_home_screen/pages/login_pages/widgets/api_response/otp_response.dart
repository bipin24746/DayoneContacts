class OtpResponse {
  String? hash;
  String? otp;
  String? phone;
  String? deviceId;
  String? fcmToken;
  String? deviceType;

  OtpResponse(
      {this.hash,
        this.otp,
        this.phone,
        this.deviceId,
        this.fcmToken,
        this.deviceType});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    otp = json['otp'];
    phone = json['phone'];
    deviceId = json['deviceId'];
    fcmToken = json['fcmToken'];
    deviceType = json['deviceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['otp'] = this.otp;
    data['phone'] = this.phone;
    data['deviceId'] = this.deviceId;
    data['fcmToken'] = this.fcmToken;
    data['deviceType'] = this.deviceType;
    return data;
  }
}