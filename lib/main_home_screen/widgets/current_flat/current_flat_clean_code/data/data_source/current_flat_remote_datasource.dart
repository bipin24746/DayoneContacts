import 'dart:convert';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/core/constants/api_constants_current_flat.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/data/models/current_flat_integration_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CurrentFlatRemoteDataSource {
  final http.Client client;

  CurrentFlatRemoteDataSource(this.client);

  Future<CurrentFlatIntegrationModel> getDataFlat() async {
    try {
      final token = await _getAuthToken();
      if (token == null) {
        throw Exception('Authentication token not found');
      }

      final response = await client.get(
        Uri.parse(ApiConstantsCurrentFlat.currentFlatEndPoint),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CurrentFlatIntegrationModel.fromJson(data);
      } else {
        throw Exception('Failed to load flats. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching data: $e');
    }
  }

  Future<String?> _getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }
}
