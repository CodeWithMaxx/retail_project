class QrTransModel {
  final String message;
  final String status;
  final List<dynamic> data;

  QrTransModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory QrTransModel.fromJson(Map<String, dynamic> json) {
    return QrTransModel(
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
