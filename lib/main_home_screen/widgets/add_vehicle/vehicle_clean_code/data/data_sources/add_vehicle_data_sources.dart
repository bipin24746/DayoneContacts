// import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_clean_code/data/models/add_vehicle_response_model.dart';
// import 'package:dio/dio.dart';
//
// abstract class AddVehicleDataSource {
//   Future<AddVehicleResponseModel> addVehicles(
//       {required String id,
//       required String type,
//       required String noplate,
//       required String name,
//       required String image});
// }
//
// class AddVehicleDataSourceimpl implements AddVehicleDataSource {
//   final Dio dio;
//
//   AddVehicleDataSourceimpl({required this.dio});
//
//   @override
//   Future<AddVehicleResponseModel> addVehicles(
//       {required String id,
//       required String type,
//       required String noplate,
//       required String name,
//       required String image}) async {
//     try {
//       final response = await dio.post(
//         'https://housing-stagingserver.aitc.ai/api/v1/client/vehicle',
//         data: {
//           'id' : id,
//           'type' : type,
//           'name' : name,
//           'noplate' : noplate,
//           'file' : image
//         }
//       );
//       if(response.statusCode == 201){
//         return AddVehicleResponseModel.fromJson(response.data);
//       }
//       else{
//         throw Exception('Failed to addvehicle');
//       }
//     } catch (e) {
//       throw Exception('Error addVehicle');
//     }
//   }
// }
