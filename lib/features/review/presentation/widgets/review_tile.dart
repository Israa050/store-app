
import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/rating_stars.dart';
import 'package:store_app/core/widgets/user_avatar.dart';

class ReviewTile extends StatelessWidget {
  final String name;
  final String date;
  final double rating;
  final String comment;
  final String avatar;

  const ReviewTile({
    super.key,
    required this.name,
    required this.date,
    required this.rating,
    required this.comment,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(imageUrl: avatar, size: 44),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 14)),
                  const SizedBox(width: 8),
                  RatingStars(rating: rating, size: 14),
                  const Spacer(),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Color(0xFF8C8C94),
                      fontSize: 12,
                    ),
                  ),
                ]),
                const SizedBox(height: 6),
                Text(
                  comment,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xFF4A4A55)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
