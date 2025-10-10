import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductImage extends StatelessWidget {
  final String? imageUrl;
  const ProductImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390.h,
      width: 160.w,
      child: Stack(
        children: [
          // CachedNetworkImage to handle image loading and error states
          CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) {
              // This widget is shown when the image fails to load (e.g., corrupted URL)
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/fast-cart.png'), // Fallback image
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
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
