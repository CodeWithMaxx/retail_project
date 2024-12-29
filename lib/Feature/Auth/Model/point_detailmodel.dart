class PointsReport {
  final List<Datum>? data;
  final String? message;
  final String? status;

  PointsReport({
    this.data,
    this.message,
    this.status,
  });

  factory PointsReport.fromJson(Map<String, dynamic> json) {
    return PointsReport(
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => Datum.fromJson(item as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((item) => item.toJson()).toList(),
      'message': message,
      'status': status,
    };
  }
}

class Datum {
  final String? transDate;
  final String? pointsAdded;
  final int? pointsRedeemed;
  final int? pointsBalance;

  Datum({
    this.transDate,
    this.pointsAdded,
    this.pointsRedeemed,
    this.pointsBalance,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      transDate: json['trans_date'] as String?,
      pointsAdded: json['points_added'] as String?,
      pointsRedeemed: json['points_redeemed'] as int?,
      pointsBalance: json['points_balance'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trans_date': transDate,
      'points_added': pointsAdded,
      'points_redeemed': pointsRedeemed,
      'points_balance': pointsBalance,
    };
  }
}
