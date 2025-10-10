import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/shimmer_primitives.dart';

class ReviewsShimmer extends StatelessWidget {
  const ReviewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        Row(
          children: const [
            ShimmerLine(width: 140, height: 16),
            SizedBox(width: 8),
            ShimmerLine(width: 10, height: 16),
            SizedBox(width: 8),
            ShimmerLine(width: 100, height: 16),
            Spacer(),
            ShimmerBox(height: 48, width: 130, borderRadius: BorderRadius.all(Radius.circular(12))),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(),
        ...List.generate(6, (_) => const _ReviewTileSkeleton()),
        const SizedBox(height: 64),
      ],
    );
  }
}

class _ReviewTileSkeleton extends StatelessWidget {
  const _ReviewTileSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ShimmerBox(height: 44, width: 44, borderRadius: BorderRadius.all(Radius.circular(22))),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLine(width: 160, height: 14),
                SizedBox(height: 8),
                ShimmerLine(width: 120, height: 14),
                SizedBox(height: 8),
                ShimmerLine(width: double.infinity),
                SizedBox(height: 6),
                ShimmerLine(width: 240),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
