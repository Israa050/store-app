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
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // ✅ Disable inner scrolling
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.95, 
            ),
            itemCount: products.items?.length ?? 0,
            itemBuilder: (context, index) {
              return ProductCard(product: products.items![index]);
            },
          ),
        ],
      ),
    );
  }
}
