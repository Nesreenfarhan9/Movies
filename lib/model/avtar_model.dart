class AvatarModel {
  final int id;
  final String imageName;

  AvatarModel({required this.id, required this.imageName});
  static List<AvatarModel> avatars = [
    AvatarModel(id: 1, imageName: 'avatar1'),
    AvatarModel(id: 2, imageName: 'avatar2'),
    AvatarModel(id: 3, imageName: 'avatar3'),
    AvatarModel(id: 4, imageName: 'avatar4'),
    AvatarModel(id: 5, imageName: 'avatar5'),
    AvatarModel(id: 6, imageName: 'avatar6'),
    // AvatarModel(id: '7', imageName: 'avatar7'),
    // AvatarModel(id: '8', imageName: 'avatar8'),
    // AvatarModel(id: '9', imageName: 'avatar9'),
  ];
}