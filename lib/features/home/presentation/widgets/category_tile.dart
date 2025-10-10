import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/features/home/data/models/category.dart';

class CategoryTile extends StatelessWidget {
  final Categories categories;
  const CategoryTile({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 20.h,
        width: 115.w,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SVG Image with error handling
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Color(0xffFEFEFE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: _buildSvg(categories.coverPictureUrl),
            ),
            // Text for category name
            Flexible(
              child: Text(
                categories.name ?? 'Adidas',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,  // Ellipsis for overflow
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to handle SVG loading with error fallback
  Widget _buildSvg(String? svgUrl) {
    return svgUrl != null && svgUrl.isNotEmpty
        ? SvgPicture.network(
            svgUrl,
            placeholderBuilder: (context) => Center(
              child: CircularProgressIndicator(), // Show loading while fetching
            ),
            // Custom error handling
            errorBuilder: (context, error, stackTrace) {
              return Center(
            child: Image.asset('assets/images/placeholder.png')
              );
            },
          )
        : Center(
            child: Image.asset('assets/images/placeholder.png')
          ); // Show a broken image icon if URL is empty or null
  }
}
