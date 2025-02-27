import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/entity/vehicle_entity.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/use_case/add_vehicle_usecase.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/use_case/get_vehicle_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

@injectable
class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  // final VehicleUseCase vehicleUseCase;

  final AddVehicleUseCase addVehicleUseCase;
  final GetVehicleUseCase getVehicleUseCase;

  VehicleBloc(this.addVehicleUseCase, this.getVehicleUseCase) : super(VehicleInitital()) {
    // Handling CreateVehicleEvent
    on<CreateVehicleEvent>((event, emit) async {
      emit(VehicleLoading());
      try {
        // Call the addVehicle method from VehicleUseCase
        final message = await addVehicleUseCase.addVehicle(
          type: event.type,
          name: event.name,
          noplate: event.noplate,
          image: event.image,
        );
        emit(VehicleSuccess('message')); // Emit success with the message
      } catch (e) {
        emit(VehicleFailure(e.toString())); // Emit failure with error message
      }
    });

    // Handling GetVehicleEvent
    on<FetchVehiclesEvent>((event, emit) async {
      emit(VehicleLoading());
      try {
        final vehicles = await getVehicleUseCase.getVehicles();

        if (vehicles.isEmpty) {
          emit(VehicleFailure("No vehicles found"));
        } else {
          emit(VehicleFetchedSuccess(vehicles));
        }
      } catch (e) {
        emit(VehicleFailure(e.toString()));
      }
    });

  }
}
