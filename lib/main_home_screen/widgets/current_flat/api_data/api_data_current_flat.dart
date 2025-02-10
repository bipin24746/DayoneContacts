class CurrentFlat {
  bool? success;
  String? message;
  Data? data;

  CurrentFlat({this.success, this.message, this.data});

  // Parsing the JSON response
  CurrentFlat.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class Data {
  String? name;
  String? id;
  Floor? floor;

  Data({this.name, this.id, this.floor});

  // Parsing the "data" field of the response
  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    floor = json['floor'] != null ? Floor.fromJson(json['floor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.floor != null) {
      data['floor'] = this.floor!.toJson();
    }
    return data;
  }
}
class Floor {
  String? id;
  String? name;
  Block? block;

  Floor({this.id, this.name, this.block});

  // Parsing the "floor" field of the response
  Floor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    block = json['block'] != null ? Block.fromJson(json['block']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.block != null) {
      data['block'] = this.block!.toJson();
    }
    return data;
  }
}
class Block {
  String? id;
  String? name;
  Apartment? apartment;

  Block({this.id, this.name, this.apartment});

  // Parsing the "block" field of the response
  Block.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    apartment = json['apartment'] != null ? Apartment.fromJson(json['apartment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.apartment != null) {
      data['apartment'] = this.apartment!.toJson();
    }
    return data;
  }
}
class Apartment {
  String? id;
  String? name;
  String? area;
  String? city;

  Apartment({this.id, this.name, this.area, this.city});

  // Parsing the "apartment" field of the response
  Apartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    area = json['area'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['area'] = this.area;
    data['city'] = this.city;
    return data;
  }
}
