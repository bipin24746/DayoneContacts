part of 'vehicle_bloc.dart';

abstract class VehicleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateVehicleEvent extends VehicleEvent {
  final String type;
  final String name;
  final String noplate;
  final File? image;

  CreateVehicleEvent({
    required this.type,
    required this.name,
    required this.noplate,
    required this.image,
  });

  @override
  List<Object?> get props => [type, name, noplate, image];
}

// Event for fetching all vehicles
class FetchVehiclesEvent extends VehicleEvent {}
