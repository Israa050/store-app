import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';

Widget productsHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'New Arrival',
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
