
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';

Widget customIconButton(){

  return  Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
          );
}