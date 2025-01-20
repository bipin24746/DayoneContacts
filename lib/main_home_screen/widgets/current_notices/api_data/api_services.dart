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