

import 'dart:developer';

import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/core/api_constants.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/data/models/all_notices_integration_models.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/repositories/shared_prefs.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AllNoticeRemoteDataSource{
  Future<AllNoticeIntegrationModel> getAllNotices();
}

@LazySingleton(as: AllNoticeRemoteDataSource)
class AllNoticeRemoteDataSourceimpl implements AllNoticeRemoteDataSource{
  final Dio dio;

AllNoticeRemoteDataSourceimpl(this.dio);

  Future<AllNoticeIntegrationModel> getAllNotices() async{
    final token = await SharedPrefs.getAuthTokens();

    if (token == null) {
      throw Exception('Authentication token not found');
    }
    try {
      final response = await dio.get(
        ApiConstants.allnoticeEndpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;  // Dio handles response data parsing
        log("data from notices: $data");
        return AllNoticeIntegrationModel.fromJson(data);
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
//
// import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/core/api_constants.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/data/models/all_notices_integration_models.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/repositories/shared_prefs.dart';
// import 'package:http/http.dart' as http;
//
// class AllNoticeRemoteDataSource{
//   final http.Client client;
//   AllNoticeRemoteDataSource(this.client);
//
//
//   Future<AllNoticeIntegrationModel> getAllNotices() async {
//     // Retrieve the token from SharedPreferences
//     final token = await SharedPrefs.getAuthTokens();
//
//     if (token == null) {
//       throw Exception('Authentication token not found');
//     }
//     try {
//       final response = await client.get(
//         Uri.parse(ApiConstants.allnoticeEndpoint),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         log("data from notices:$data");
//         return AllNoticeIntegrationModel.fromJson(data);
//       } else {
//         throw Exception('Failed to load notices');
//       }
//     } catch (e) {
//       throw Exception('Failed to load notices');
//     }
//   }
// }


