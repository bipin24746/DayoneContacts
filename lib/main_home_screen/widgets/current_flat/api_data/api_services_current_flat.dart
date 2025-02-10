import 'dart:developer';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/api_data/api_data_current_flat.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CurrentFlatApiServices {
  Future<CurrentFlat?> getData() async {
    var uri = 'https://housing-stagingserver.aitc.ai/api/v1/client/user/currentflat';

    final prefs = await SharedPreferences.getInstance();
    final authtoken = prefs.getString('authToken');

    var response = await http.get(Uri.parse(uri),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $authtoken',
        });

    log('Response from the server: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = convert.json.decode(response.body);

      return CurrentFlat.fromJson(responseData);  // Parse the response
    } else {
      throw Exception('Failed to load flat data');
    }
  }
}
