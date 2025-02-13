import 'dart:developer';

import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/entity/integration.dart';

class CurrentFlatIntegrationModel extends CurrentFlatIntegration {
  CurrentFlatIntegrationModel({required bool success, required Data data})
      : super(success: success, data: data);

  factory CurrentFlatIntegrationModel.fromJson(Map<String, dynamic> json) {
    log("Received JSON: $json");
    return CurrentFlatIntegrationModel(
      success: json["success"],
      data: DataModel.fromJson(json["data"]),  // Now it's a single Data object
    );
  }
}

class DataModel extends Data {
  DataModel({required String id, required String name, required String floor})
      : super(id: id, name: name, floor: floor);

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json["name"],
      floor: json["floor"],
    );
  }
}
