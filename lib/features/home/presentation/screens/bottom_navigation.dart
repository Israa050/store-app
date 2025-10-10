
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtomNavigation extends StatelessWidget {
  const CustomButtomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
           BoxShadow(
                  color: Color(0x1D1E2014), // Color of the shadow (using RGBA format)
                  offset: Offset(0, -4),     // Position of the shadow (horizontal, vertical)
                  blurRadius: 20,            // Blur radius
                  spreadRadius: 0,           // Spread radius
                ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          SvgPicture.asset('assets/svgs/home.svg'),
          SvgPicture.asset('assets/svgs/heart.svg'),
          SvgPicture.asset('assets/svgs/cart_icon.svg'),
          SvgPicture.asset('assets/svgs/wallet.svg'),


        ],
      ),
    );
  }
}