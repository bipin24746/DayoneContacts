import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/base_response.dart';
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
  Future<Either<Failure, BaseResponseEntity>> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    try {
      final result = await dataSource.addVehicle(
        type: type,
        name: name,
        noplate: noplate,
        image: image,
      );
      return Right(BaseResponseModel(message: result));
    } catch (e) {
      // Catch specific exceptions (e.g., network issues, etc.)
      return Left(ServerFailure("Error adding vehicle: $e"));
    }
  }

  @override
  Future<Either<Failure, List<VehicleEntity>>> getVehicles() async {
    try {
      final vehiclesRaw = await dataSource.getVehicles();
      return Right(vehiclesRaw);
    } catch (e) {
      // Return a Left with the appropriate Failure for error handling
      return Left(ServerFailure("Error fetching vehicles: $e"));
    }
  }
}
