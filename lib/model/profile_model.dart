class ProfileModel {
  final String name;
  final String avatarUrl;
  final int wishListCount;
  final int historyCount;

  ProfileModel({
    required this.name,
    required this.avatarUrl,
    required this.wishListCount,
    required this.historyCount,
  });
}