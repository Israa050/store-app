import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/features/home/presentation/widgets/categories_header.dart';

class CategoriesLoading extends StatelessWidget {
  const CategoriesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Column(
        children: [
          categoriesHeader(context),
      
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return loadingTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget loadingTile() {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      height: 20.h,
      width: 115.w,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Color(0xffFEFEFE),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 20.0, // Height of the placeholder (adjust as needed)
              width: 50.0, // Width of the placeholder (adjust as needed)
              color: Colors.white, // Background color
            ),
          ],
        ),
      ),
    ),
  );
}
