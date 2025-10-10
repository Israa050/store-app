
import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/widgets/categories_loading.dart';
import 'package:store_app/features/home/presentation/widgets/offers_loading.dart';
import 'package:store_app/features/home/presentation/widgets/products_loading.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        OffersLoading(),

        CategoriesLoading(),

        ProductsLoading()

     
      ]
    );
  }
}