import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/shimmer_primitives.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        const _ItemSkeleton(),
        const SizedBox(height: 12),
        const _ItemSkeleton(),
        const SizedBox(height: 16),
        const ShimmerLine(width: 140, height: 16),
        const SizedBox(height: 8),
        const _TileLine(),
        const SizedBox(height: 12),
        const ShimmerLine(width: 140, height: 16),
        const SizedBox(height: 8),
        const _TileLine(),
        const SizedBox(height: 16),
        const ShimmerLine(width: 100, height: 16),
        const SizedBox(height: 8),
        const _AmountRow(),
        const _AmountRow(),
        const _AmountRow(),
        const SizedBox(height: 80),
      ],
    );
  }
}

class _ItemSkeleton extends StatelessWidget {
  const _ItemSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: const [
          ShimmerBox(height: 72, width: 72, borderRadius: BorderRadius.all(Radius.circular(12))),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLine(width: 180, height: 14),
                SizedBox(height: 6),
                ShimmerLine(width: 120, height: 12),
                SizedBox(height: 6),
                ShimmerLine(width: 160, height: 12),
                SizedBox(height: 10),
                ShimmerLine(width: 100, height: 34),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TileLine extends StatelessWidget {
  const _TileLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          ShimmerBox(height: 36, width: 36, borderRadius: BorderRadius.all(Radius.circular(8))),
          SizedBox(width: 12),
          Expanded(child: ShimmerLine(height: 14, width: double.infinity)),
          SizedBox(width: 12),
          ShimmerBox(height: 24, width: 24, borderRadius: BorderRadius.all(Radius.circular(12))),
        ],
      ),
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Row(
        children: const [
          ShimmerLine(width: 100, height: 12),
          Spacer(),
          ShimmerLine(width: 60, height: 12),
        ],
      ),
    );
  }
}
