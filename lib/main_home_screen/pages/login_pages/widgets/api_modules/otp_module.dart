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

  Future<dynamic> verifyOtp(String otp, String phone, String hash, String deviceId, String fcmToken) async {
    final String apiUrl = 'https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify';
    log('//$otp/////$hash///$deviceId///$fcmToken////$phone');

    try {
      Response response = await _dio.post(
        apiUrl,
        data: {
          // "otp": otp,
          // "phone": phone,
          // "hash": hash,
          // "deviceId": deviceId,
          // "fcmToken": fcmToken,
          // "deviceType": "android",
          "otp": otp,
          "phone":phone,
          "hash":hash,
          "deviceId": "04762b6a13fe52fb",
          "fcmToken": "fhCbQpQSQCKFH5pIXRl8aL:APA91bFQurQq0hivgZGZ3A3QI4IkZojznFPgtskZsvVh16aSnl56JkquQVMddRq3QNSIJe7qv4YlxI7Uv-N_YsxqeYb4_1Wy551BYzCFJCObDXZE-VzLtIhp1iBBy8nv-PyTTKTx1apL",
          "deviceType": "android",
        },
        // options: Options(
        //   headers: {
        //     "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0ZGI1YTIwLWM2MmYtNDc2Yi05NzM5LWU0MWQ3ZjdjYTVkYyIsImN1cnJlbnRBcGFydG1lbnQiOiI5YjdmYTJjNS1jNzQ3LTQ2NWMtOTViZS0zZTVjNTllOTY3YzMiLCJjdXJyZW50RmxhdCI6IjQxYjU5ZjkwLTg5ZDctNDk2NS04MWI1LTZmMTdmZWU2NmMyNiIsImlhdCI6MTczNzUyMzQ1MSwiZXhwIjoxNzM3NTI1MjUxfQ.h4IG96lmaOqBhD6Uc1BkKOWx32ghnF_TBeDqcwFQU4A", // Replace with actual token if necessary
        //   },
        // ),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        print("suzz");
        // OTP verified successfully
        return;
      } else {
        throw Exception("OTPsas verification failed: ${response.data['message'] ?? 'Unknown error'}");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception("Errors: ${e.response?.data['message'] ?? 'Unknown error'}");
      } else {
        throw Exception("Connection failed: ${e.message}");
      }
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