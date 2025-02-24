import 'dart:io';

import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/repository/add_vehicle_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddVehicleUseCase {
  final AddVehicleRepository addVehicleRepository;
  AddVehicleUseCase(this.addVehicleRepository);

  Future<String> call({
    required String type,
    required String name,
    required String noplate,
    File? image,
  }) async {
    return await addVehicleRepository.addVehicle(
        type: type, name: name, noplate: noplate, image: image);
  }
}
