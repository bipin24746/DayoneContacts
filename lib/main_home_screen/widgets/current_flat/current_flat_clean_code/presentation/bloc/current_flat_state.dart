part of 'current_flat_bloc.dart';

abstract class CurrentFlatState extends Equatable{
  const CurrentFlatState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CurrentFlatInitial extends CurrentFlatState{}

class CurrenFlatLoading extends CurrentFlatState{}
class CurrentFlatLoaded extends CurrentFlatState{
  final CurrentFlatIntegration currentFlatIntegration;
  const CurrentFlatLoaded({required this.currentFlatIntegration});

  @override
  // TODO: implement props
  List<Object?> get props => [currentFlatIntegration];
}
class CurrentFlatError extends CurrentFlatState{
  final String message;
  const CurrentFlatError({required this.message});


  @override
  // TODO: implement props
  List<Object?> get props => [message];
}