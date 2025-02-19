import 'dart:developer';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/core/constants/api_constants_current_flat.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/data/models/current_flat_integration_models.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/data/models/shared_prefs.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';



abstract class CurrentFlatRemoteDataSource{
  Future<CurrentFlatIntegrationModel> getDataFlat();
}


@LazySingleton(as: CurrentFlatRemoteDataSource)
class CurrentFlatRemoteDataSourceimpl implements CurrentFlatRemoteDataSource{
  final Dio dio;

  CurrentFlatRemoteDataSourceimpl(this.dio);

  Future<CurrentFlatIntegrationModel> getDataFlat() async {
    try {
      // Retrieve the authentication token
      final token = await SharedPrefs.getAuthTokens();
      if (token == null) {
        throw Exception('Authentication token not found');
      }

      // Set up Dio headers with Authorization token
      dio.options.headers['Authorization'] = 'Bearer $token';

      // Make the API request
      final response = await dio.get(ApiConstantsCurrentFlat.currentFlatEndPoint);

      // Check if the status code is 200 (success)
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        log('Data from flats: $data');
        // Ensure that CurrentFlatIntegrationModel can handle the data
        return CurrentFlatIntegrationModel.fromJson(data);
      } else {
        // Handle different HTTP errors more specifically
        throw Exception('Failed to load flats: ${response.statusCode}');
      }
    } catch (e) {
      // Catching any errors and logging them
      log('Error fetching flat data: $e');
      throw Exception('Failed to load flats');
    }
  }
}

//     try {
//       final token = await _getAuthToken();
//       if (token == null) {
//         throw Exception('Authentication token not found');
//       }
//
//       final response = await client.get(
//         Uri.parse(ApiConstantsCurrentFlat.currentFlatEndPoint),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         return CurrentFlatIntegrationModel.fromJson(data);
//       } else {
//         throw Exception('Failed to load flats. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error occurred while fetching data: $e');
//     }
//   }
//
//   Future<String?> _getAuthToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('authToken');
//   }
// }
