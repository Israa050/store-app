

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/features/home/data/models/offer_model.dart';
import 'package:store_app/features/home/presentation/widgets/offers_carousel.dart';

class HomeScreen extends StatelessWidget {
  final offers = [
      OfferModel(
        title: 'Big Sale',
        subtitle: 'Up to 50%',
        highlight: 'Happening Now',
        imageUrl: 'assets/images/lock.png',
      ),
      OfferModel(
        title: 'New Arrivals',
        subtitle: 'Exclusive Styles',
        highlight: 'Shop Today',
        imageUrl: 'assets/images/lock.png',
      ),
      OfferModel(
        title: 'Flash Deals',
        subtitle: 'Limited Time',
        highlight: 'Grab It Fast',
        imageUrl: 'assets/images/lock.png',
      ),
    ];
    
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SvgPicture.asset('assets/svgs/cart.svg'),
        ],
      ),
      body: Column(
        children: [

          OffersCarousel(offers: offers),



        ],
      ),
    );
  }
}