// import 'dart:convert';
// import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/entity/vehicle_integration.dart';
// import 'package:equatable/equatable.dart';
//
// // VehicleIntegrationModel extends the base VehicleIntegration class
// class VehicleIntegrationModel extends VehicleIntegration {
//   const VehicleIntegrationModel({
//     required bool success,
//     required String messsage,
//     required List<Data> data,
//   }) : super(success: success, messsage: messsage, data: data);
//
//   // Deserialize JSON into VehicleIntegrationModel object
//   factory VehicleIntegrationModel.fromJson(Map<String, dynamic> json) {
//     return VehicleIntegrationModel(
//       success: json['success'] ?? false,
//       messsage: json['message'] ?? '',
//       data: json['data'] != null
//           ? List<Data>.from(json['data'].map((x) => DataModel.fromJson(x)))
//           : [],
//     );
//   }
//
//   // Serialize VehicleIntegrationModel object to JSON
//   @override
//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'message': messsage,
//       'data': data.map((e) => e.id).toList(),
//     };
//   }
//
//   @override
//   List<Object?> get props => [success, data, messsage];
// }
//
// // DataModel extends Data class for vehicle data
// class DataModel extends Data {
//   const DataModel({
//     required String id,
//     required String image,
//     required String name,
//     required String type,
//     required String noPlate,
//   }) : super(id: id, image: image, name: name, type: type, noPlate: noPlate);
//
//   // Deserialize JSON into DataModel object
//   factory DataModel.fromJson(Map<String, dynamic> json) {
//     return DataModel(
//       id: json['id'] ?? '',
//       type: json['type'] ?? '',
//       noPlate: json['noplate'] ?? '',
//       name: json['name'] ?? '',
//       image: json['image'] != null && json['image']['url'] != null
//           ? json['image']['url'] ?? ''
//           : '', // Handle image URL properly
//     );
//   }
//
//   // Serialize DataModel object to JSON
//   @override
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'type': type,
//       'noplate': noPlate,
//       'name': name,
//       'image': {
//         'url': image,
//         'name': image.split('/').last, // Using the last part of the URL as the image name (if desired)
//         'id': id, // Image id can be different if needed
//       },
//     };
//   }
//
//   @override
//   List<Object?> get props => [id, image, name, type, noPlate];
// }
