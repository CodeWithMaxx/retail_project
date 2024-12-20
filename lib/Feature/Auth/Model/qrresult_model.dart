class qr_tran_result {
  final String message;
  final String status;
  final List<dynamic> data;

  qr_tran_result({
    required this.message,
    required this.status,
    required this.data,
  });

  factory qr_tran_result.fromJson(Map<String, dynamic> json) {
    return qr_tran_result(
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
