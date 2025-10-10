import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating; // 0..5
  final double size;
  final int max;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 16,
    this.max = 5,
  });

  @override
  Widget build(BuildContext context) {
    final full = rating.floor();
    final half = (rating - full) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(max, (i) {
        IconData icon;
        if (i < full) {
          icon = Icons.star_rounded;
        } else if (i == full && half) {
          icon = Icons.star_half_rounded;
        } else {
          icon = Icons.star_border_rounded;
        }
        return Icon(icon, size: size, color: const Color(0xFFFFA41B));
      }),
    );
  }
}
