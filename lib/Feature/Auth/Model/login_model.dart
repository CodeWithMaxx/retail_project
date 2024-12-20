class LoginApiModel {
  Data? data;
  String? message;
  String? status;

  LoginApiModel({this.data, this.message, this.status});

  LoginApiModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? personId;
  String? personName;
  String? address;
  String? city;
  String? mobileNo;
  String? factoryId;

  Data(
      {this.personId,
        this.personName,
        this.address,
        this.city,
        this.mobileNo,
        this.factoryId});

  Data.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    personName = json['person_name'];
    address = json['address'];
    city = json['city'];
    mobileNo = json['mobile_no'];
    factoryId = json['factory_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['person_id'] = this.personId;
    data['person_name'] = this.personName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['mobile_no'] = this.mobileNo;
    data['factory_id'] = this.factoryId;
    return data;
  }
}
