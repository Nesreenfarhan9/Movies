class UpdateProfileResponse {
  final String? message; //nullable?

  UpdateProfileResponse({required this.message});

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      message: json.containsKey('message') ? json['message'] as String? : "No message from server",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message ?? "No message available",
    };
  }
}

