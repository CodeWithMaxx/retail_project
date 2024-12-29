class RedeemPointModel {
  final String message;
  final String status;
  final List<dynamic> data;

  RedeemPointModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory RedeemPointModel.fromJson(Map<String, dynamic> json) {
    return RedeemPointModel(
      message: json['message'],
      status: json['status'],
      data: json['data'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'data': data,
    };
  }
}
