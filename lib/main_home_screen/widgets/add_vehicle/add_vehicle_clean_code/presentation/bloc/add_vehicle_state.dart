part of 'add_vehicle_bloc.dart';

abstract class AddVehicleState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddVehicleInitital extends AddVehicleState{

}

class AddVehicleLoading extends AddVehicleState{}

class AddVehicleSuccess extends AddVehicleState{
  final String message;
  AddVehicleSuccess(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class AddVehicleFailure extends AddVehicleState{
  final String error;
  AddVehicleFailure(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class AddVehicleErrorState extends AddVehicleState{
  final String errorMessage;
  AddVehicleErrorState({
    required this.errorMessage
});
}