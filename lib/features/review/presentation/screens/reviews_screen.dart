import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/app_icon_button.dart';
import 'package:store_app/core/widgets/rating_stars.dart';
import 'package:store_app/features/review/data/repos/product_review_repo.dart';
import 'package:store_app/features/review/presentation/widgets/review_tile.dart';


class ReviewsScreen extends StatefulWidget {
  static const route = '/reviews';
  String id;
   ReviewsScreen({super.key,required this.id});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {



  @override
  void initState() {
    super.initState();
    getReviews();
  }

  void getReviews()async{
    await context.read<ProductReviewRepo>().getProductReviews(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    final reviews = List.generate(8, (i) {
      return const ReviewTile(
        name: 'Jenny Wilson',
        date: '13 Sep, 2020',
        rating: 4.8,
        comment:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet…',
        avatar: 'https://i.pravatar.cc/150?img=11',
      );
    });

    return Scaffold(
      appBar: AppBar(
        leading: AppIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text('Reviews'),
        actions: const [SizedBox(width: 8)],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Add Review'),
        icon: const Icon(Icons.add_rounded),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          _Header(
            totalCount: 245,
            average: 4.8,
          ),
          const SizedBox(height: 8),
          const Divider(),
          ...reviews,
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final int totalCount;
  final double average;

  const _Header({required this.totalCount, required this.average});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$totalCount Reviews',
            style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(width: 8),
        const Text('•'),
        const SizedBox(width: 8),
        RatingStars(rating: average, size: 16),
        const SizedBox(width: 6),
        Text(
          average.toStringAsFixed(1),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        // SizedBox(
        //   width: 130,
        //   child: PrimaryButton(
        //     label: 'Add Review',
        //     leading: const Icon(Icons.add_rounded, size: 18),
        //     onPressed: () {},
        //   ),
        // ),
      ],
    );
  }
}
