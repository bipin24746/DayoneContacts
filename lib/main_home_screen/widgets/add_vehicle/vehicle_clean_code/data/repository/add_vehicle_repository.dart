// // lib/data/repositories/vehicle_repository.dart
// import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_clean_code/data/data_sources/add_vehicle_data_sources.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_clean_code/data/models/add_vehicle_response_model.dart';
// import 'package:dio/dio.dart';
//
//
// class VehicleRepository {
//   final AddVehicleApiService _apiService;
//
//   VehicleRepository(this._apiService);
//
//   Future<void> addVehicle(Vehicle vehicle) async {
//     try {
//       await _apiService.addVehicle(vehicle);
//     } catch (e) {
//       throw Exception("Failed to add vehicle: $e");
//     }
//   }
// }
