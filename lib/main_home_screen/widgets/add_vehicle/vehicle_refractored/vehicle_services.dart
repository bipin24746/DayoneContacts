import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleService {
  static Future<void> addVehicle({
    required String vehicleName,
    required String vehicleNumber,
    required String vehicleType,
    File? image,
    required BuildContext context,
  }) async {
    Dio dio = Dio();
    final url = 'https://housing-stagingserver.aitc.ai/api/v1/client/vehicle';

    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Authorization token is missing.")));
      return;
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    try {
      final data = {
        'type': vehicleType,
        'name': vehicleName,
        'noplate': vehicleNumber,
        'file': image != null
            ? await MultipartFile.fromFile(image.path, filename: "")
            : '',
      };

      FormData formData = FormData.fromMap(data);

      final response = await dio.post(url, data: formData);

      if (response.statusCode == 201) {
        final responseData = response.data;
        if (responseData['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Vehicle created successfully")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(responseData['message'] ?? 'Unknown error')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${response.statusCode}")));
      }
    } catch (e) {
      print("Error: $e");
      if (e is DioError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Dio Error: ${e.response?.data}")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred")));
      }
    }
  }
}
