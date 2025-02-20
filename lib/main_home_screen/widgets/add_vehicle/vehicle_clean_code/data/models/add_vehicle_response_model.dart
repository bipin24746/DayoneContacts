// lib/data/models/vehicle_response.dart
class AddVehicleResponseModel extends AddVehicleResponseEntity{
  AddVehicleResponseModel({
    required bool success,
    required String message,
    required Vehicle? vehicle
    AddVehicleResponseDataModel? addVehicleResponseDataModel
}) : super(
    message: message,
    success: success,
    Vehicle: vehicle,
    addVehicleResponseDataEntity: addVehicleResponseDataModel,
  );

  factory AddVehicleResponseModel.fromJson(Map<String, dynamic> json) =>
      AddVehicleResponseModel(
        success: json['success'] as bool,
        message: json['message'].toString(),
          addVehicleResponseDataModel: AddVehicleResponseDataModel.fromJson(
            json['data'] as Map<String, dynamic>,
          )
      );
}

class AddVehicleResponseDataModel extends AddVehicleResponseDataEntity{
  const AddVehicleResponseDataModel({
    required super.type;
    required super.name;
    required super.vehicleNumber;
    required super.imagePath;
});

  factory AddVehicleResponseDataModel.fromJson(Map<String,dynamic> json) =>
      AddVehicleResponseDataModel(
        type: json['type'] as String? ?? '',
        name: json['name'] as String? ?? '',
        vehicleNumber: json['vehicleNumber'] as String? ?? '',
        imagePath: json['imagePath'] as String? ?? '',
      )
}


//
// class VehicleResponse {
//   final bool success;
//   final String message;
//   final Vehicle? vehicle;
//
//   VehicleResponse({
//     required this.success,
//     required this.message,
//     this.vehicle,
//   });
//
//   // Factory method to create VehicleResponse from JSON
//   factory VehicleResponse.fromJson(Map<String, dynamic> json) {
//     return VehicleResponse(
//       success: json['success'] ?? false,
//       message: json['message'] ?? '',
//       vehicle: json['vehicle'] != null
//           ? Vehicle.fromJson(json['vehicle'])
//           : null, // Handling a vehicle object inside response
//     );
//   }
//
//   // Method to convert VehicleResponse into JSON (for sending requests if needed)
//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'message': message,
//       'vehicle': vehicle?.toJson(),
//     };
//   }
// }
//
// // Vehicle model class for the response
// class Vehicle {
//   final String type;
//   final String name;
//   final String vehicleNumber;
//   final String? imagePath;
//
//   Vehicle({
//     required this.type,
//     required this.name,
//     required this.vehicleNumber,
//     this.imagePath,
//   });
//
//   // Factory method to create Vehicle from JSON
//   factory Vehicle.fromJson(Map<String, dynamic> json) {
//     return Vehicle(
//       type: json['type'] ?? '',
//       name: json['name'] ?? '',
//       vehicleNumber: json['noplate'] ?? '', // Mapping 'noplate' to vehicleNumber
//       imagePath: json['file'] ?? '', // Image path field can be 'file'
//     );
//   }
//
//   // Method to convert Vehicle to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'type': type,
//       'name': name,
//       'noplate': vehicleNumber,
//       'file': imagePath,
//     };
//   }
// }




// class Vehicle {
//   final String type;
//   final String name;
//   final String vehicleNumber;
//   final String? imagePath;
//
//   Vehicle({
//     required this.type,
//     required this.name,
//     required this.vehicleNumber,
//     this.imagePath,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'type': type,
//       'name': name,
//       'noplate': vehicleNumber,
//       'file': imagePath,
//     };
//   }
// }
