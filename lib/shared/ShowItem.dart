import 'package:flutter/material.dart';

import '../feature_auth/presentation/view_model/avtar_model.dart';

class ShowItem extends StatelessWidget {
  final AvatarModel avatar;
  ShowItem({required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/${avatar.imageName}.png',
      fit: BoxFit.contain,
      width: MediaQuery.sizeOf(context).width * 0.4,
      height: MediaQuery.sizeOf(context).width * 0.4,
    );
  }
}