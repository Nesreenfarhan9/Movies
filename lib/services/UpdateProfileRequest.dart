class UpdateProfileRequest {
  final String? email;
  final int? avatarId;
  final String? name;
  final String? phone;

  UpdateProfileRequest({this.email, this.avatarId, this.name, this.phone});

  Map<String, dynamic> toJson() {
    return {
      if (email != null) 'email': email,
      if (avatarId != null) 'avatarId': avatarId, // Fixed typo from 'avaterId'
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
    };
  }
}
