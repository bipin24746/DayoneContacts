import 'package:dio/dio.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/data/models/auth_model/auth_response_model.dart';

class AuthDataSource {
  final Dio dio;

  AuthDataSource(this.dio);

  // Define the performAuth method
  Future<AuthResponseModel> performAuth({required String phoneNo}) async {
    try {
      final response = await dio.post(
        'https://housing-stagingserver.aitc.ai/api/v1/client/auth', // The API endpoint for authentication
        data: {'contact': phoneNo}, // Pass necessary data (e.g., phone number)
      );

      // Handle the response from the API
      if (response.statusCode == 200) {
        // Parse and return the response as AuthResponseModel
        return AuthResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      throw Exception('Error during authentication:');
    }
  }
}



