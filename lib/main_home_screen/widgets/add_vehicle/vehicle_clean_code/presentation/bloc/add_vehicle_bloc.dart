//
//
//
//
// import 'package:bloc/bloc.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_clean_code/data/repository/add_vehicle_repository.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_clean_code/presentation/bloc/add_vehicle_event.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_clean_code/presentation/bloc/add_vehicle_state.dart';
//
// class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
//   final VehicleRepository _vehicleRepository;
//
//   VehicleBloc(this._vehicleRepository) : super(VehicleInitial());
//
//   @override
//   Stream<VehicleState> mapEventToState(VehicleEvent event) async* {
//     if (event is AddVehicleEvent) {
//       yield VehicleLoading();
//       try {
//         await _vehicleRepository.addVehicle(event.vehicle);
//         yield VehicleSuccess();
//       } catch (e) {
//         yield VehicleFailure(error: e.toString());
//       }
//     }
//   }
// }
