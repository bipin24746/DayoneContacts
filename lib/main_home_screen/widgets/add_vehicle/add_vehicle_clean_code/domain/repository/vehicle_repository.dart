import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/data/data_source/vehicle_remote_data_source.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/entity/vehicle_entity.dart';

abstract class VehicleRepository {
  Future<Either<Failure,BaseResponseEntity>> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  });

  Future<Either<Failure, List<VehicleEntity>>> getVehicles();
}
//
// class VehicleRepositoryImpl implements VehicleRepository {
//   final VehicleRemoteDataSource remoteDataSource;
//
//   // Constructor to initialize remoteDataSource
//   VehicleRepositoryImpl({required this.remoteDataSource});
//
//   @override
//   Future<String> addVehicle({
//     required String type,
//     required String name,
//     required String noplate,
//     File? image,
//   }) async {
//     return await remoteDataSource.addVehicle(
//       type: type,
//       name: name,
//       noplate: noplate,
//       image: image,
//     );
//   }
//
//   @override
//   Future<Either<Failure, List<VehicleEntity>>> getVehicles() async {
//     try {
//       final vehiclesData = await remoteDataSource.getVehicles();
//
//       // Convert to entity
//       final vehicles = vehiclesData.map((vehicle) => VehicleEntity(
//         id: vehicle['id'],
//         name: vehicle['name'],
//         type: vehicle['type'],
//         noplate: vehicle['noplate'],
//         imageUrl: vehicle['image'] != null ? vehicle['image']['url'] : '',
//       )).toList();
//
//       if (vehicles.isEmpty) {
//         return Left(ServerFailure("No vehicles found"));
//       }
//
//       return Right(vehicles);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }
