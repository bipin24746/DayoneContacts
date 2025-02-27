import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/entity/vehicle_entity.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/repository/vehicle_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetVehicleUseCase{
  final VehicleRepository vehicleRepository;
  const GetVehicleUseCase(this.vehicleRepository);

  Future<List<VehicleEntity>> getVehicles() async {
    final result = await vehicleRepository.getVehicles();
//TODO:: don't use any logic or anything here just return the repo methods.
    ///TODO:: use this fold in bloc
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