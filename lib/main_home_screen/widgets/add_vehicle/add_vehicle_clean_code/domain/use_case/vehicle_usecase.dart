import 'dart:io';

import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/repository/vehicle_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class VehicleUseCase {
  final VehicleRepository vehicleRepository;
  VehicleUseCase(this.vehicleRepository);

  Future<String> call({
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    return await vehicleRepository.addVehicle(
        type: type, name: name, noplate: noplate, image: image);
  }
}
