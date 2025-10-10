import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  const UserAvatar({
    super.key,
    required this.imageUrl,
    this.size = 36,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: NetworkImage(imageUrl),
      backgroundColor: const Color(0xFFE9E9EE),
    );
  }
}
