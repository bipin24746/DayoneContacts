//
// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// class OtpApi {
//   final Dio _dio = Dio();
//
//   Future<void> verifyOtp(String otp, String phone, String hash, String deviceId, String fcmToken) async {
//     final response = await _dio.post(
//       'https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify',
//       data: {
//         "otp": otp,
//         "phone": phone,
//         "hash": hash,
//         "deviceId": deviceId,
//         "fcmToken": fcmToken,
//         "deviceType": "android",
//       },
//     );
//
//     if (response.statusCode == 200 && response.data['success']) {
//       log("OTP verification successful");
//     } else {
//       throw Exception("OTP verification failed");
//     }
//   }
// }
//
//
