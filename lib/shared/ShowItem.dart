import 'package:flutter/material.dart';

import '../model/avtar_model.dart';

class ShowItem extends StatelessWidget {
  AvatarModel avatar;
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