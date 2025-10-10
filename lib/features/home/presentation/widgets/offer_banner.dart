import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';

class OfferBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String highlightText;
  final String imageUrl;
  final int currentIndex;
  final int total;
  final ValueChanged<int>? onPageChanged;

  const OfferBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.highlightText,
    required this.imageUrl,
    this.currentIndex = 0,
    this.total = 3,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              //width: double.infinity,
              height: 180,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
