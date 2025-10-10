import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/data/models/product.dart';
import 'package:store_app/features/home/presentation/widgets/product_image.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  const ProductCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 15,top: 15,left: 10),
      child: SizedBox(
        height: 400.h,
        width: 160.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Expanded(flex: 4, child: ProductImage(imageUrl:product?.coverPictureUrl??
             'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/191aec31-c323-43a9-9441-33a99630980f/NKB+B+NSW+FUTURA+PROPUS+SET.png',)),
        
            Text(
              product?.name??
              'Nike Sportswear Club\n Fleece',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
        
            Text(
             '\$${product?.price.toString()}',
            // '\$99', 
             style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
              ),
          ],
        ),
      ),
    );
  }
}
