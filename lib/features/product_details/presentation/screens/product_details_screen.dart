import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/app_icon_button.dart';
import 'package:store_app/core/widgets/error_widget.dart';
import 'package:store_app/core/widgets/primary_button.dart';
import 'package:store_app/features/product_details/logic/cubit/product_cubit.dart';
import 'package:store_app/features/product_details/presentation/widgets/product_details_shimmer.dart';
import 'package:store_app/features/product_details/presentation/widgets/product_success.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String id;
  const ProductDetailsScreen({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    getProduct();
  }

  void getProduct() async {
    await context.read<ProductCubit>().getProductDetials(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onPressed: () => Navigator.maybePop(context),
        ),
        actions: [
          AppIconButton(icon: Icons.favorite_border_rounded, onPressed: () {}),
          const SizedBox(width: 8),
        ],
      ),
      bottomNavigationBar: _BottomBar(
        total: context.watch<ProductCubit>().total ?? 0,
        onAdd: () {},
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          switch (state) {
            case ProductInitial():
            case Loading():
              return ProductDetailsShimmer();
            case ProductSuccuss():
              return ProductSuccessWidget(
                product: state.product,
                review: state.review,
              );
            case Faliuare():
              return errorWiget(state.error.icon, state.error.errors[0]);
          }
        },
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final double total;
  final VoidCallback onAdd;

  const _BottomBar({required this.total, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Price',
                    style: TextStyle(color: Color(0xFF8C8C94), fontSize: 12),
                  ),
                  Text(
                    '\$${total.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: PrimaryButton(
                label: 'Add to Cart',
                onPressed: onAdd,
                leading: const Icon(Icons.shopping_bag_rounded, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
