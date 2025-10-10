import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';

Widget offersHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Special Offers',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'View All',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}
