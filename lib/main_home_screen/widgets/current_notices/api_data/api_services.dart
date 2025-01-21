import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'api_data.dart';
import 'dart:convert' as convert;

class ApiServices {
  Future<Integration?> getData() async {
    final accessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0ZGI1YTIwLWM2MmYtNDc2Yi05NzM5LWU0MWQ3ZjdjYTVkYyIsImN1cnJlbnRBcGFydG1lbnQiOiI5YjdmYTJjNS1jNzQ3LTQ2NWMtOTViZS0zZTVjNTllOTY3YzMiLCJjdXJyZW50RmxhdCI6IjQxYjU5ZjkwLTg5ZDctNDk2NS04MWI1LTZmMTdmZWU2NmMyNiIsImlhdCI6MTczNzQzMzY0MywiZXhwIjoxNzM3NDM1NDQzfQ.dblN_sv9G3b8jd5YbyKdiOwVX1dXtJp2BXad3AVU2-8';
    var uri = 'https://housing-stagingserver.aitc.ai/api/v1/client/notice' ;
    var response = await http.get(Uri.parse(uri),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      }, );


    log('response from the server:${response.body}');

    if (response.statusCode == 200) {
      // Parse the response data as a Map<String, dynamic>
      final Map<String, dynamic> responseData = convert.json.decode(response.body);

      // Now return the data by using the Integration.fromJson method
      return Integration.fromJson(responseData);
    } else {
      throw Exception('Failed to load integrations');
    }


  }
}












// import 'package:dayonecontacts/main_home_screen/widgets/current_notices/api_data/api_data.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
//
// class NoticeService {
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://housing-stagingserver.aitc.ai/api/v1/client',
//       headers: {
//         'Authorization': 'Bearer fhCbQpQSQCKFH5pIXRl8aL:APA91bFQurQq0hivgZGZ3A3QI4IkZojznFPgtskZsvVh16aSnl56JkquQVMddRq3QNSIJe7qv4YlxI7Uv-N_YsxqeYb4_1Wy551BYzCFJCObDXZE-VzLtIhp1iBBy8nv-PyTTKTx1apL',
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//       },
//     ),
//   );
//
//
//
//   Future<List<Notice>> fetchNotices() async {
//     try {
//       final response = await _dio.get('/notice');
//       if (response.statusCode == 200 && response.data['success'] == true) {
//         List<dynamic> noticesJson = response.data['data'];
//         return noticesJson.map((json) => Notice.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to fetch notices: ${response.data['message']}');
//       }
//     } on DioError catch (e) {
//       // Log or print the error
//       debugPrint('DioError: ${e.message}');
//       debugPrint('Error response: ${e.response?.data}');
//       // Re-throw or handle the error based on type
//       throw Exception('Failed to fetch notices: ${e.response?.statusCode}');
//     }
//   }
// }