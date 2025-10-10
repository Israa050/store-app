
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/features/home/data/models/category.dart';

class CategoryTile extends StatelessWidget {
  final Categories categories;
  const CategoryTile({super.key,required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 20.h,
        width: 115.w,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10,),
        ),
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
              child: Image.asset('assets/images/${categories.name}.png'),
            ),
      
            //horizontalPadding(10),
      
            Text(categories.name?? 'Adidas',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black,),)
          ],
        ),
      ),
    );
  }
}