import 'dart:convert';
import 'dart:developer';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/core/constants/api_constants.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/data/models/shared_prefs.dart';
import 'package:dio/dio.dart';

import '../models/integration_models.dart';

class NoticeRemoteDataSource {
  final Dio dio;

  // Constructor to inject Dio instance
  NoticeRemoteDataSource(this.dio);

  Future<IntegrationModel> getNotices() async {
    // Retrieve the token from SharedPreferences
    final token = await SharedPrefs.getAuthToken();

    if (token == null) {
      throw Exception('Authentication token not found');
    }

    try {
      final response = await dio.get(
        ApiConstants.noticeEndpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;  // Dio handles response data parsing
        log("data from notices: $data");
        return IntegrationModel.fromJson(data);
      } else {
        throw Exception('Failed to load notices');
      }
    } catch (e) {
      throw Exception('Failed to load notices: $e');
    }
  }
}




// import 'dart:convert';
// import 'dart:developer';
// import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/core/constants/api_constants.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/data/models/shared_prefs.dart';
// import 'package:http/http.dart' as http;
//
// import '../models/integration_models.dart';
//
// class NoticeRemoteDataSource {
//   final http.Client client;
//
//   NoticeRemoteDataSource(this.client);
//
//   Future<IntegrationModel> getNotices() async {
//     // Retrieve the token from SharedPreferences
//     final token = await SharedPrefs.getAuthToken();
//
//     if (token == null) {
//       throw Exception('Authentication token not found');
//     }
//     try {
//       final response = await client.get(
//         Uri.parse(ApiConstants.noticeEndpoint),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         log("data from notices:$data");
//         return IntegrationModel.fromJson(data);
//       } else {
//         throw Exception('Failed to load notices');
//       }
//     } catch (e) {
//       throw Exception('Failed to load notices');
//     }
//   }
// }
