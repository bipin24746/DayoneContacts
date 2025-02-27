import 'dart:developer';
import 'dart:io';

import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/data/model/vehicle_model.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/entity/vehicle_entity.dart'; // Ensure this import

abstract class VehicleRemoteDataSource {
  Future<String> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  });

  Future<List<VehicleEntity>> getVehicles();
}

@LazySingleton(as: VehicleRemoteDataSource)
class VehicleRemoteDataSourceImpl implements VehicleRemoteDataSource {
  final Dio dio = Dio();
  final String url =
      'https://housing-stagingserver.aitc.ai/api/v1/client/vehicle'; // API URL

  @override
  Future<String> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      throw Exception("Authorization token is missing.");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      FormData formData = FormData.fromMap({
        'type': type,
        'name': name,
        'noplate': noplate,
      });

      // Add image to form data if it's provided
      if (image != null) {
        formData.files.add(
          MapEntry(
            "file",
            await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
              contentType: DioMediaType('image', 'jpeg'), // Ensure correct mime type
            ),
          ),
        );
      }

      final response = await dio.post(url, data: formData);

      // Handle response
      if (response.statusCode == 201 && response.data['success'] == true) {
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log("Error during vehicle creation: $e");
      throw Exception("Error during vehicle creation: $e");
    }
  }


  @override
  Future<List<VehicleEntity>> getVehicles() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken == null) {
      throw Exception("Authorization token is missing.");
    }

    dio.options.headers = {
      'Authorization': 'Bearer $authToken',
    };

    try {
      final response = await dio.get(url);
      log("API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {

      final listResponse = List<VehicleEntity>.from((response.data['data'] as List? ??[]).map((x)=>VehicleModel.fromJson(x)));
      log(' response $listResponse');
      return listResponse;
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception("Error fetching vehicles: $e");
    }
  }


}
