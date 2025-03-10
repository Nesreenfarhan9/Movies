class LoginResponse {
  final String message;
  final String data;

  LoginResponse({required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] as String,
      data: json['data'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data,
    };
  }
}
