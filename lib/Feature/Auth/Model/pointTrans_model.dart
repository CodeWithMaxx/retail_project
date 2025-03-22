class PointTransModel {
  Data? data;
  String? message;
  String? status;

  PointTransModel({this.data, this.message, this.status});

  PointTransModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (data != null) {
      map['data'] = data!.toJson();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }
}

class Data {
  String? totPointsAdded;
  String? totPointsRedeemed;
  String? totPointsExpired;
  int? balPoints;

  Data(
      {this.totPointsAdded,
      this.totPointsRedeemed,
      this.totPointsExpired,
      this.balPoints});

  Data.fromJson(Map<String, dynamic> json) {
    totPointsAdded = json['tot_points_added'];
    totPointsRedeemed = json['tot_points_redeemed'];
    totPointsExpired = json['tot_points_expired'];
    balPoints = json['bal_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['tot_points_added'] = totPointsAdded;
    map['tot_points_redeemed'] = totPointsRedeemed;
    map['tot_points_expired'] = totPointsExpired;
    map['bal_points'] = balPoints;
    return map;
  }
}
