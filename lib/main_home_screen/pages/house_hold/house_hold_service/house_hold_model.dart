class AddVehicleModel {
  bool? success;
  String? message;
  List<Data>? data;

  AddVehicleModel({this.success, this.message, this.data});

  AddVehicleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? type;
  String? noplate;
  String? name;
  String? clientUserId;
  String? createdAt;
  String? updatedAt;
  bool? archive;
  String? flatId;
  Image? image;

  Data(
      {this.id,
        this.type,
        this.noplate,
        this.name,
        this.clientUserId,
        this.createdAt,
        this.updatedAt,
        this.archive,
        this.flatId,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    noplate = json['noplate'];
    name = json['name'];
    clientUserId = json['clientUserId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    archive = json['archive'];
    flatId = json['flatId'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['noplate'] = this.noplate;
    data['name'] = this.name;
    data['clientUserId'] = this.clientUserId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['archive'] = this.archive;
    data['flatId'] = this.flatId;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  String? url;
  String? name;
  String? id;

  Image({this.url, this.name, this.id});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
