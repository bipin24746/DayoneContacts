

class CurrentFlat {
  bool? success;
  String? message;
  Data? data;

  CurrentFlat({this.success, this.message, this.data});

  factory CurrentFlat.fromJson(Map<String, dynamic> json) {
    return CurrentFlat(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  String? name;
  String? id;
  Floor? floor;

  Data({this.name, this.id, this.floor});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'],
      id: json['id'],
      floor: json['floor'] != null ? Floor.fromJson(json['floor']) : null,
    );
  }
}

class Floor {
  String? id;
  String? name;
  Block? block;

  Floor({this.id, this.name, this.block});

  factory Floor.fromJson(Map<String, dynamic> json) {
    return Floor(
      id: json['id'],
      name: json['name'],
      block: json['block'] != null ? Block.fromJson(json['block']) : null,
    );
  }
}

class Block {
  String? id;
  String? name;
  Apartment? apartment;

  Block({this.id, this.name, this.apartment});

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      id: json['id'],
      name: json['name'],
      apartment: json['apartment'] != null ? Apartment.fromJson(json['apartment']) : null,
    );
  }
}

class Apartment {
  String? id;
  String? name;
  String? area;
  String? city;

  Apartment({this.id, this.name, this.area, this.city});

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      id: json['id'],
      name: json['name'],
      area: json['area'],
      city: json['city'],
    );
  }
}