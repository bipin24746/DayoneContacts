// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'vehicle_api_data.dart';  // Ensure this is correct
//
// class ApiServices {
//   Future<VehicleModel> postVehicle({
//     required String vehicleName,
//     required String vehicleNumber,
//     required String vehicleType,
//   }) async {
//     var uri = 'https://housing-stagingserver.aitc.ai/api/v1/client/vehicle';
//     final prefs = await SharedPreferences.getInstance();
//     final authToken = prefs.getString('authToken');  // Getting token from shared preferences
//
//     // If there's no auth token, throw an error
//     if (authToken == null) {
//       throw Exception('Authorization token not found');
//     }
//
//     var request = http.MultipartRequest('POST', Uri.parse(uri))
//       ..headers[HttpHeaders.authorizationHeader] = 'Bearer $authToken'
//       ..fields['vehicleName'] = vehicleName
//       ..fields['vehicleNumber'] = vehicleNumber
//       ..fields['vehicleType'] = vehicleType;
//
//     // Send the request without the image field
//     try {
//       var response = await request.send();
//
//       // Check if the response is successful
//       if (response.statusCode == 200) {
//         final responseString = await response.stream.bytesToString();
//         final Map<String, dynamic> responseData = json.decode(responseString);
//         return VehicleModel.fromJson(responseData);  // Return parsed message
//       } else {
//         // Log the response body for better debugging
//         final responseBody = await response.stream.bytesToString();
//         log('Response Body: $responseBody');
//         throw Exception('Failed to add vehicle, status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       log('Error: $e');
//       throw Exception('Failed to add vehicle: $e');
//     }
//   }
// }
