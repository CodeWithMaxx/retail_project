class PointTransModel {
  Data? data;
  String? message;
  String? status;

  PointTransModel({this.data, this.message, this.status});

  PointTransModel.fromJson(Map<String, dynamic> json) {
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
  String? totPointsAdded;
  String? totPointsRedeemed;
  int? balPoints;

  Data({this.totPointsAdded, this.totPointsRedeemed, this.balPoints});

  Data.fromJson(Map<String, dynamic> json) {
    totPointsAdded = json['tot_points_added'];
    totPointsRedeemed = json['tot_points_redeemed'];
    balPoints = json['bal_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tot_points_added'] = this.totPointsAdded;
    data['tot_points_redeemed'] = this.totPointsRedeemed;
    data['bal_points'] = this.balPoints;
    return data;
  }
}
