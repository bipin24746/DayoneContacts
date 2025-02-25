import 'dart:io';

import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/entity/vehicle_entity.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/repository/vehicle_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class VehicleUseCase {
  final VehicleRepository vehicleRepository;
  VehicleUseCase(this.vehicleRepository);

  Future<String> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    return await vehicleRepository.addVehicle(
        type: type, name: name, noplate: noplate, image: image);
  }

  Future<List<VehicleEntity>> getVehicles() async {
    final result = await vehicleRepository.getVehicles();

    return result.fold(
          (failure) {
        // Handle failure case
        print("Error fetching vehicles: ${failure.message}");
        return []; // Return an empty list on failure
      },
          (vehicles) {
        // Success case: return the list of vehicles
        print("Vehicles fetched: ${vehicles.length}");
        if (vehicles.isEmpty) {
          print("No vehicles available.");
        }
        return vehicles;
      },
    );
  }
}
