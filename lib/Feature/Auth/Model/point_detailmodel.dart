class PointsReportmodel {
  List<Data>? data;
  String? message;
  String? status;

  PointsReportmodel({this.data, this.message, this.status});

  PointsReportmodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? transDate;
  String? particulars;
  String? points;
  int? pointsBalance;

  Data({this.transDate, this.particulars, this.points, this.pointsBalance});

  Data.fromJson(Map<String, dynamic> json) {
    transDate = json['trans_date'];
    particulars = json['particulars'];
    points = json['points'];
    pointsBalance = json['points_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trans_date'] = this.transDate;
    data['particulars'] = this.particulars;
    data['points'] = this.points;
    data['points_balance'] = this.pointsBalance;
    return data;
  }
}
