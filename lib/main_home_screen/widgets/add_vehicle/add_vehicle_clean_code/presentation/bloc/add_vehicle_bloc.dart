import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/use_case/add_vehicle_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'add_vehicle_event.dart';
part 'add_vehicle_state.dart';


@injectable
class AddVehicleBloc extends Bloc<AddVehicleEvent, AddVehicleState> {
  final AddVehicleUseCase addVehicleUseCase;
  AddVehicleBloc(this.addVehicleUseCase) : super(AddVehicleInitital()) {
    on<SubmitVehicleEvent>((event,emit) async{
      emit(AddVehicleLoading());
      try{
        final message = await addVehicleUseCase(
          type: event.type,
          name: event.name,
          noplate: event.noplate,
          image: event.image,
        );
        emit(AddVehicleSuccess(message));
      }
      catch(e){
        emit(AddVehicleFailure(e.toString()));
      }
    });
  }
}
