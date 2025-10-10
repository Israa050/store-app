
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/features/home/presentation/widgets/products_header.dart';

class ProductsLoading extends StatelessWidget {
  const ProductsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        productsHeader(context),
        GridView.builder(
            shrinkWrap: true, // ✅ Important to make it work inside Column
            physics: const NeverScrollableScrollPhysics(), // ✅ Disable inner scrolling
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.95, // optional: control card size
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return productCardLoading();
            },
          ),
      ],
    );
  }
}

Widget productCardLoading(){
  return Padding(
      padding:  EdgeInsets.only(right: 15,top: 15,left: 10),
    child: SizedBox(
       height: 400.h,
        width: 160.w,
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: productImagePlaceholder()),

            verticalPadding(5),
        
            Container(
                height: 20.0, // Height of the placeholder (adjust as needed)
                width: 50.0, // Width of the placeholder (adjust as needed)
                color: Colors.white, // Background color
              ),

              verticalPadding(5),
        
              Container(
                height: 20.0, // Height of the placeholder (adjust as needed)
                width: 20.0, // Width of the placeholder (adjust as needed)
                color: Colors.white, // Background color
              ),
        
          ],
        ),
      ),
    ),
  );

}


Widget productImagePlaceholder(){
  return SizedBox(
      height: 390.h,
      width: 160.w,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
}