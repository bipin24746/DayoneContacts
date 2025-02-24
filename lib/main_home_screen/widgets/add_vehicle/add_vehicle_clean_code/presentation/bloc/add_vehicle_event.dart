part of 'add_vehicle_bloc.dart';

abstract class AddVehicleEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SubmitVehicleEvent extends AddVehicleEvent {
  final String type;
  final String name;
  final String noplate;
  final File? image;

  SubmitVehicleEvent({
    required this.type,
    required this.name,
    required this.noplate,
    required this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [type, name, noplate, image];
}
