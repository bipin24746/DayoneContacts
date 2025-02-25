part of 'vehicle_bloc.dart';

abstract class VehicleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VehicleInitital extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehicleSuccess extends VehicleState {

  final String message;
  VehicleSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class VehicleFetchedSuccess extends VehicleState {
  final List<VehicleEntity> vehicles;

  VehicleFetchedSuccess(this.vehicles) {
    log("Vehicles in Bloc: ${vehicles.length}");
  }
}



class VehicleFailure extends VehicleState {
  final String error;
  VehicleFailure(this.error);

  @override
  List<Object?> get props => [error];
}
