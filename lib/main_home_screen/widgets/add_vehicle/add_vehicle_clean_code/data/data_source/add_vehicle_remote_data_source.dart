import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddVehicleRemoteDataSource{
  Future<String> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  });
}

@LazySingleton(as: AddVehicleRemoteDataSource)
class AddVehicleRemoteDataSourceimpl implements AddVehicleRemoteDataSource {
  final Dio dio = Dio();
  final String url =
      'https://housing-stagingserver.aitc.ai/api/v1/client/vehicle';

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
      'Content-Type': 'multipart/form-data',
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
              contentType: MediaType('image', 'jpeg'), // Ensure correct mime type
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
      throw Exception("Error during vehicle creation: $e");
    }
  }
}
