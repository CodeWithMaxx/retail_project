class UserProfile {
  Data? data;
  String? message;
  String? status;

  UserProfile({this.data, this.message, this.status});

  UserProfile.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
  String? personName;
  String? address;
  String? city;
  String? contactNo;
  String? mobileNo;
  String? email;
  String? aadhar;
  String? panNo;
  String? bankName;
  Null? bankBranch;
  String? bankAcNo;
  String? ifsc;

  Data(
      {this.personName,
      this.address,
      this.city,
      this.contactNo,
      this.mobileNo,
      this.email,
      this.aadhar,
      this.panNo,
      this.bankName,
      this.bankBranch,
      this.bankAcNo,
      this.ifsc});

  Data.fromJson(Map<String, dynamic> json) {
    personName = json['person_name'];
    address = json['address'];
    city = json['city'];
    contactNo = json['contact_no'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    aadhar = json['aadhar'];
    panNo = json['pan_no'];
    bankName = json['bank_name'];
    bankBranch = json['bank_branch'];
    bankAcNo = json['bank_ac_no'];
    ifsc = json['ifsc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['person_name'] = this.personName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['contact_no'] = this.contactNo;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['aadhar'] = this.aadhar;
    data['pan_no'] = this.panNo;
    data['bank_name'] = this.bankName;
    data['bank_branch'] = this.bankBranch;
    data['bank_ac_no'] = this.bankAcNo;
    data['ifsc'] = this.ifsc;
    return data;
  }
}
