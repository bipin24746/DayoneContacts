// import 'package:dio/dio.dart';
//
// class OtpApi {
//   final Dio _dio = Dio();
//
//   Future<void> verifyOtp(
//       String otp, ) async {
//     try {
//       Response response = await _dio.post(
//         'https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify',
//         data: {
//           "otp": otp,
//
//         },
//       );
//
//       if (response.statusCode == 200 && response.data['success'] == true) {
//         return; // OTP verified successfully
//       } else {
//         throw Exception("OTP verification failed: ${response.data['message']}");
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         throw Exception(
//             "Error: ${e.response?.data['message'] ?? 'Unknown error'}");
//       } else {
//         throw Exception("Connection failed: ${e.message}");
//       }
//     } catch (e) {
//       throw Exception("Unexpected error: $e");
//     }
//   }
// }
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
class OtpApi {
  final Dio _dio = Dio();

  Future<void> verifyOtp(String otp, String phone, String hash, String deviceId, String fcmToken) async {
    final response = await _dio.post(
      'https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify',
      data: {
        "otp": otp,
        "phone": phone,
        "hash": hash,
        "deviceId": deviceId,
        "fcmToken": fcmToken,
        "deviceType": "android",
      },
    );

    if (response.statusCode == 200 && response.data['success']) {
      log("OTP verification successful");
    } else {
      throw Exception("OTP verification failed");
    }
  }
}




// import 'package:dio/dio.dart';
// class OtpApi{
//   final Dio _dio = Dio();
//   Future<void> verifyOtp(String otp) async{
//     try{
//       Response response = await _dio.post('https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify',
//       data: {
//         "otp" :otp
//       }
//       );
//
//       if(response.statusCode == 200){
//
//         return response.data;
//       }
//       else{
//         throw Exception("not verified otp");
//       }
//
//     }on DioException catch (e){
//       if(e.response != null){
//
//       }
//     }
//   }
// }