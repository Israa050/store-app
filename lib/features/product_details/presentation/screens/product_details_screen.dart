import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/app_icon_button.dart';
import 'package:store_app/core/widgets/image_thumbnail.dart';
import 'package:store_app/core/widgets/primary_button.dart';
import 'package:store_app/core/widgets/section_header.dart';
import 'package:store_app/core/widgets/size_option_chip.dart';
import 'package:store_app/features/review/presentation/widgets/review_tile.dart';


class ProductDetailsScreen extends StatelessWidget {
  static const route = '/product-details';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock product
    const images = [
      'https://picsum.photos/id/1011/600/600',
      'https://picsum.photos/id/1000/600/600',
      'https://picsum.photos/id/1005/600/600',
      'https://picsum.photos/id/1006/600/600',
    ];
    const sizes = ['S', 'M', 'L', 'XL', '2XL'];

    return Scaffold(
      appBar: AppBar(
        leading: AppIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onPressed: () => Navigator.maybePop(context),
        ),
        actions: [
          AppIconButton(
            icon: Icons.favorite_border_rounded,
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      bottomNavigationBar: _BottomBar(total: 125, onAdd: () {}),
      body:
      // BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
       // builder: (context, state) {
           SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeroImage(
                  url: images[0],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 72,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) => ImageThumbnail(
                      url: images[i],
                      selected: true,
                      onTap: () => {}
                          //context.read<ProductDetailsCubit>().selectImage(i),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemCount: images.length,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Nike Club Fleece',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text("Men's Printed Pullover Hoodie",
                        style: TextStyle(color: Color(0xFF8C8C94))),
                    const Spacer(),
                    Text('\$120',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                        )),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Size',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Size Guide'),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: sizes
                      .map((s) => SizeOptionChip(
                            label: s,
                            selected: true, // s == state?.selectedSize,
                            onTap: ()=> {},
                              //  context.read<ProductDetailsCubit>().selectSize(s),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),
                const SectionHeader(
                  title: 'Description',
                ),
                const SizedBox(height: 8),
                Text(
                  'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with …',
                  style: const TextStyle(color: Color(0xFF4A4A55)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Read More..'),
                ),
                const SizedBox(height: 8),
                SectionHeader(
                  title: 'Reviews',
                  trailingText: 'View All',
                  onTapTrailing: () => {},
                ),
                const SizedBox(height: 8),
                const ReviewTile(
                  name: 'Ronald Richards',
                  date: '13 Sep, 2020',
                  rating: 4.8,
                  comment:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet…',
                  avatar: 'https://i.pravatar.cc/150?img=5',
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Text('Total Price',
                        style: TextStyle(
                            color: Color(0xFF8C8C94), fontSize: 12)),
                    Spacer(),
                    Text('\$125',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800)),
                  ],
                ),
                const SizedBox(height: 90), // space for bottom bar
              ],
            ),
          )
      );
  }
}

class _HeroImage extends StatelessWidget {
  final String url;
  const _HeroImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // nice square
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(url, fit: BoxFit.cover),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.local_fire_department_rounded,
                        size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text('New',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
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
      padding:
          const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
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
                  const Text('Total Price',
                      style:
                          TextStyle(color: Color(0xFF8C8C94), fontSize: 12)),
                  Text('\$${total.toStringAsFixed(0)}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w800)),
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
