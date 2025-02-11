part of 'current_flat_bloc.dart';

abstract class CurrentFlatEvent extends Equatable{
  const CurrentFlatEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FetchCurrentFlat extends CurrentFlatEvent{}