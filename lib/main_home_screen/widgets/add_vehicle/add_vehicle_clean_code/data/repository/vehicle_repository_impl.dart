import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/data/data_source/vehicle_remote_data_source.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/entity/vehicle_entity.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/repository/vehicle_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VehicleRepository)
class VehicleRepositoryImpl implements VehicleRepository {
  final VehicleRemoteDataSource dataSource;

  VehicleRepositoryImpl(this.dataSource);
  @override
  Future<String> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    try {
      return await dataSource.addVehicle(
        type: type,
        name: name,
        noplate: noplate,
        image: image,
      );
    } catch (e) {
      throw Exception("Error adding vehicle: $e");
    }
  }

  @override
  Future<Either<Failure, List<VehicleEntity>>> getVehicles() async {
    try {
      final vehiclesRaw = await dataSource.getVehicles();

      if (vehiclesRaw.isEmpty) {
        print("No vehicles found in repository.");
        return Left(ServerFailure("No vehicles found"));
      }

      final vehicles = vehiclesRaw.map((vehicleData) {
        return VehicleEntity.fromMap(vehicleData);
      }).toList();

      return Right(vehicles);
    } catch (e) {
      return Left(ServerFailure("Error fetching vehicles: $e"));
    }
  }
}
