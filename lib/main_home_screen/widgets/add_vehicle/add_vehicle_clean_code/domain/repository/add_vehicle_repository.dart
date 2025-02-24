import 'dart:io';

abstract class AddVehicleRepository{
  Future<String> addVehicle({
    required String type,
    required String name,
    required String noplate,
    File? image,
});
}