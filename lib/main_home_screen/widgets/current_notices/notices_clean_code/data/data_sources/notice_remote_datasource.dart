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
    final authtoken = await SharedPrefs.getAuthToken();

    if (authtoken == null) {
      throw Exception('Authentication token not found');
    }

    final response = await client.get(
      Uri.parse(ApiConstants.noticeEndpoint),
      headers: {
        'Authorization': 'Bearer $authtoken', // Use the retrieved token
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      log("data from notices:$data");
      return IntegrationModel.fromJson(data);
    } else {
      throw Exception('Failed to load notice');
    }
  }
}