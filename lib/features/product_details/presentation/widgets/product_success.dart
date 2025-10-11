
import 'package:flutter/material.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/widgets/section_header.dart';
import 'package:store_app/core/widgets/size_option_chip.dart';
import 'package:store_app/features/home/data/models/product.dart';
import 'package:store_app/features/product_details/presentation/widgets/hero_image.dart';
import 'package:store_app/features/review/data/models/review.dart';
import 'package:store_app/features/review/presentation/widgets/review_tile.dart';

class ProductSuccessWidget extends StatelessWidget {
  Product product;
  Items review;
   ProductSuccessWidget({super.key,required this.product,required this.review});

  // Mock product
    // static const images = [
    //   'https://picsum.photos/id/1011/600/600',
    //   'https://picsum.photos/id/1000/600/600',
    //   'https://picsum.photos/id/1005/600/600',
    //   'https://picsum.photos/id/1006/600/600',
    // ];
    static const sizes = ['S', 'M', 'L', 'XL', '2XL'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroImage(
                  url: product.coverPictureUrl?? '',
                ),
                const SizedBox(height: 12),
                // SizedBox(
                //   height: 72,
                //   child: ListView.separated(
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (_, i) => ImageThumbnail(
                //       url: '',//images[i],
                //       selected: true,
                //       onTap: () => {}
                //           //context.read<ProductDetailsCubit>().selectImage(i),
                //     ),
                //     separatorBuilder: (_, __) => const SizedBox(width: 10),
                //     itemCount: 4,// images.length,
                //   ),
                // ),
                const SizedBox(height: 16),
                Text(
                  product.name??
                  'Nike Club Fleece',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                     Text( product.arabicDescription ?? "Men's Printed Pullover Hoodie",
                        style: TextStyle(color: Color(0xFF8C8C94))),
                    const Spacer(),
                    Text('\$${product.price}',
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
                  product.description??
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
                  onTapTrailing: () => 
                    context.pushNamed(Routes.review,arguments: product.id)
                  ,
                ),
                const SizedBox(height: 8),
                 ReviewTile(
                  name: review.userName ??
                   'Ronald Richards',
                  date: '13 Sep, 2020',
                  rating: 4.8,
                  comment: 
                  review.comment??
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet…',
                  avatar: 'https://i.pravatar.cc/150?img=5',
                ),
                const SizedBox(height: 8),
                Row(
                  children:  [
                    Text('Total Price',
                        style: TextStyle(
                            color: Color(0xFF8C8C94), fontSize: 12)),
                    Spacer(),
                    Text('\$${product.price?.toStringAsFixed(1)}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800)),
                  ],
                ),
                const SizedBox(height: 90), // space for bottom bar
              ],
            ),
          );
  }
}

