import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/features/home/data/models/product.dart';
import 'package:store_app/features/home/presentation/widgets/product_card.dart';
import 'package:store_app/features/home/presentation/widgets/products_header.dart';

class ProductsSection extends StatelessWidget {
  final Products products;
  const ProductsSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Header
         productsHeader(context),

          // 🔹 Grid - Non-scrollable
          GridView.builder(
            shrinkWrap: true, // ✅ Important to make it work inside Column
            physics: const NeverScrollableScrollPhysics(), // ✅ Disable inner scrolling
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
             // mainAxisSpacing: 20,
             // crossAxisSpacing: 15,
              childAspectRatio: 0.95, // optional: control card size
            ),
            itemCount: products.items?.length ?? 0,
            itemBuilder: (context, index) {
              // Optional: Assign mock image
              // String imageUrl =
              //     //'https://images.unsplash.com/photo-1606741965326-cb990ae01bb2?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
              //     //'https://m.media-amazon.com/images/I/61YziIqPv+L._AC_SY879_.jpg';
              // //    'https://www.shutterstock.com/image-photo/couple-fresh-orgnaic-potatos-on-600nw-1429764656.jpg';
              //    // 'https://m.media-amazon.com/images/I/517TzbOKGpL.jpg';
              //     'https://images.unsplash.com/photo-1586062129117-08db958ba215?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
              // if (index <= 3) {
              //   products.items![index].coverPictureUrl = imageUrl;
              // }
              return ProductCard(product: products.items![index]);
            },
          ),
        ],
      ),
    );
  }
}
