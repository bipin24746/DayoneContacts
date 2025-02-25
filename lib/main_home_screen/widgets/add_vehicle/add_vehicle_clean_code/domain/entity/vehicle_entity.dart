class VehicleEntity {
  final String id;
  final String type;
  final String name;
  final String noplate;
  final String? imageUrl;

  // Constructor
  VehicleEntity({
    required this.id,
    required this.type,
    required this.name,
    required this.noplate,
    this.imageUrl,
  });

  // fromJson method to map API response to VehicleEntity
  factory VehicleEntity.fromJson(Map<String, dynamic> json) {
    return VehicleEntity(
      id: json['id'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      noplate: json['noplate'] as String,
      imageUrl: json['image'] != null ? json['image']['url'] as String? : null,
    );
  }

  // fromMap method to convert map data to VehicleEntity
  factory VehicleEntity.fromMap(Map<String, dynamic> map) {
    return VehicleEntity(
      id: map['id'] as String,
      type: map['type'] as String,
      name: map['name'] as String,
      noplate: map['noplate'] as String,
      imageUrl: map['image'] != null ? map['image']['url'] as String? : null,
    );
  }

  // toJson method to convert VehicleEntity to JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'noplate': noplate,
      'image': imageUrl != null ? {'url': imageUrl} : null,
    };
  }
}
