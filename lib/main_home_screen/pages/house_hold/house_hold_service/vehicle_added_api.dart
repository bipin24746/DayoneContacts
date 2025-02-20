import 'dart:developer';
import 'dart:io';
import 'package:dayonecontacts/main_home_screen/pages/house_hold/house_hold_service/house_hold_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class ApiVehicleAdded {
  final Dio _dio = Dio();

  Future<List<AddVehicleModel>> getVehicleData() async {
    var url = 'https://housing-stagingserver.aitc.ai/api/v1/client/vehicle';

    final prefs = await SharedPreferences.getInstance();
    final authtoken = prefs.getString('authToken');

    if (authtoken == null) {
      throw Exception("Authorization token is missing");
    }

    _dio.options.headers = {
      HttpHeaders.authorizationHeader: 'Bearer $authtoken',
    };

    try {
      // Send GET request to fetch vehicle data
      final response = await _dio.get(url);

      log('Response from the server: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;

        // Assuming the response contains a list of vehicles
        return responseData.map((item) => AddVehicleModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load vehicles');
      }
    } on DioError catch (e) {
      // Handle Dio-specific errors
      if (e.response != null) {
        log('Error response: ${e.response}');
      } else {
        log('Error message: ${e.message}');
      }
      throw Exception('Failed to load vehicles');
    }
  }
}
