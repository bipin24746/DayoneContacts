import 'dart:convert';
import 'dart:developer';

import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/core/constants/api_constants.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/data/models/shared_prefs.dart';
import 'package:http/http.dart' as http;

import '../models/integration_models.dart';

class NoticeRemoteDataSource {
  final http.Client client;

  NoticeRemoteDataSource(this.client);

  Future<IntegrationModel> getNotices() async {
    // Retrieve the token from SharedPreferences
    final authToken = await SharedPrefs.getAuthToken();

    if (authToken == null) {
      throw Exception('Authentication token not found');
    }


    final response = await client.get(
      Uri.parse('https://housing-stagingserver.aitc.ai/api/v1/client/notice'),
      headers: {
        'Authorization': 'Bearer $authToken', // 🔹 Add the token here
        'Content-Type': 'application/json',
      },
    );

    // Making the HTTP request
    // final response = await client.get(
    //   Uri.parse(ApiConstants.noticeEndpoint),
    //   headers: {
    //     'Authorization': 'Bearer $authToken', // Use the retrieved token
    //   },
    // );

    if (response.statusCode == 200) {
      // Parsing the response data
      final data = json.decode(response.body);
      log('Response status: ${response.statusCode}, data: $data');

      // Returning the parsed model
      return IntegrationModel.fromJson(data);
    } else {
      // Log the error response for debugging
      log('Error response: ${response.body}');
      throw Exception('Failed to load notice: ${response.statusCode}');
    }
  }
}
