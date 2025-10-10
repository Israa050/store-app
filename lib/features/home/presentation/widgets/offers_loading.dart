
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/features/home/presentation/widgets/offers_header.dart';

class OffersLoading extends StatelessWidget {
  const OffersLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         offersHeader(context),
      Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Shimmer.fromColors(
         baseColor: Colors.grey[300]!,
         highlightColor: Colors.grey[100]!,
        child: Container(
          //width: double.infinity,
          height: 180,
          decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20,)),
        ),
      )
    )
      ],
    );
  }
}