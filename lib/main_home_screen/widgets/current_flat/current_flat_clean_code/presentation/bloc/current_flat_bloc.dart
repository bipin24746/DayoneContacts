import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/entity/integration.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/usecases/get_current_flat.dart';
import 'package:equatable/equatable.dart';

part 'current_flat_event.dart';
part 'current_flat_state.dart';

class CurrentFlatBloc extends Bloc<CurrentFlatEvent, CurrentFlatState> {
  final GetCurrentFlat getCurrentFlat;

  CurrentFlatBloc({required this.getCurrentFlat}) : super(CurrentFlatInitial()) {
    on<FetchCurrentFlat>(_onFetchCurrentFlat);
  }


  void _onFetchCurrentFlat(FetchCurrentFlat event, Emitter<CurrentFlatState> emit) async {
    emit(CurrentFlatLoading());
    final Either<Failure, CurrentFlatIntegration> result = await getCurrentFlat();

    result.fold(
            (failure) => emit(CurrentFlatError(message: failure.toString())),
            (currentflat) => emit(CurrentFlatLoaded(currentFlatIntegration: currentflat)));
  }
}
