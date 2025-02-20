class AddVehicleModel extends AddVehicleEntity{
  const AddVehicleModel({
    required super.type;
    required super.name;
    required super.vehicleNumber;
    required super.imagePath;
});
  factory AddVehicleModel.fromJson(Map<String, dynamic> json) =>
      AddVehicleModel(
        type: json['type'] as String? ?? '',
        name: json['name'] as String? ?? '',
        vehicleNumber: json['vehicleNumber'] as String? ?? '',
        imagePath: json['imagePath'] as String? ?? '',
      )
}