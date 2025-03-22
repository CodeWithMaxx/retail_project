class Registration {
  List<dynamic> data;
  String message;
  String status;

  Registration(
      {required this.data, required this.message, required this.status});

  factory Registration.fromJson(Map<String, dynamic> json) {
    return Registration(
      data: json['data'] ?? [],
      message: json['message'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'message': message,
      'status': status,
    };
  }
}
