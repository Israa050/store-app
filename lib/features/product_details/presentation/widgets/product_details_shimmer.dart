import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/shimmer_primitives.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // hero
          const AspectRatio(aspectRatio: 1, child: ShimmerBox(height: double.infinity, width: double.infinity)),
          const SizedBox(height: 12),
          // thumbs
          SizedBox(
            height: 72,
            child: Row(
              children: List.generate(4, (i) => const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ShimmerBox(height: 60, width: double.infinity),
                ),
              )),
            ),
          ),
          const SizedBox(height: 16),
          const ShimmerLine(height: 18, width: 200),
          const SizedBox(height: 8),
          Row(
            children: const [
              ShimmerLine(height: 14, width: 180),
              Spacer(),
              ShimmerLine(height: 18, width: 60),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              ShimmerLine(height: 16, width: 50),
              Spacer(),
              ShimmerLine(height: 16, width: 80),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(5, (i) => const ShimmerBox(height: 40, width: 56)),
          ),
          const SizedBox(height: 16),
          const ShimmerLine(height: 16, width: 110),
          const SizedBox(height: 8),
          const ShimmerLine(width: double.infinity),
          const SizedBox(height: 6),
          const ShimmerLine(width: double.infinity),
          const SizedBox(height: 6),
          const ShimmerLine(width: 220),
          const SizedBox(height: 12),
          const ShimmerLine(height: 16, width: 80),
          const SizedBox(height: 8),
          // single review tile skeleton
          Row(
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
                    ShimmerLine(width: double.infinity),
                    SizedBox(height: 6),
                    ShimmerLine(width: 240),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }
}
