
import 'package:equatable/equatable.dart';

abstract class VehicleState extends Equatable {
  const VehicleState();

  @override
  List<Object> get props => [];
}

class VehicleInitial extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehicleSuccess extends VehicleState {}

class VehicleFailure extends VehicleState {
  final String error;

  const VehicleFailure({required this.error});

  @override
  List<Object> get props => [error];
}
