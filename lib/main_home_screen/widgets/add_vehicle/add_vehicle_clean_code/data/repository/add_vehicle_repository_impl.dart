import 'dart:io';

import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/data/data_source/add_vehicle_remote_data_source.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/domain/repository/add_vehicle_repository.dart';
import 'package:injectable/injectable.dart';



@LazySingleton(as: AddVehicleRepository)
class AddVehicleRepositoryImpl implements AddVehicleRepository{

  final AddVehicleRemoteDataSource dataSource;

  AddVehicleRepositoryImpl(this.dataSource);
  @override
  Future<String> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
})async{
    return await dataSource.addVehicle(
      type: type,
      name: name,
      noplate: noplate,
      image: image,
    );
  }
}