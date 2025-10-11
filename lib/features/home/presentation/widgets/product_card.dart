import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/routing/routes.dart';
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
        
            Expanded(flex: 4, child: InkWell(
              onTap: () {
                context.pushNamed(Routes.productDetails,arguments: product?.id);
              },
              child: ProductImage(
                imageUrl:product?.coverPictureUrl??'',),),),


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
