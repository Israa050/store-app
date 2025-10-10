import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductImage extends StatelessWidget {
  final String? imageUrl;
  const ProductImage({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390.h,
      width: 160.w,
      child: Stack(
        children: [
          // Background image container
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:  DecorationImage(
                image: 
                CachedNetworkImageProvider(imageUrl?? ''),
                 //AssetImage('assets/images/product.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // SVG icon positioned in top-right corner
          Positioned(
            top: 15, // Adjust as needed
            right: 20, // Adjust as needed
            child: SvgPicture.asset(
              'assets/svgs/heart.svg',
              height: 24.h,
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}
