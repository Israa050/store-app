import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/features/home/data/models/offer.dart';
import 'package:store_app/features/home/presentation/widgets/offers_header.dart';
import 'offer_banner.dart';

class OffersCarousel extends StatefulWidget {
  final Offers offers;

  const OffersCarousel({
    super.key,
    required this.offers,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  final PageController _pageController = PageController();
  //late Timer _autoSlideTimer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Listen for page changes
    _pageController.addListener(() {
      final newIndex = _pageController.page?.round() ?? 0;
      if (newIndex != _currentIndex) {
        setState(() => _currentIndex = newIndex);
      }
    });

   
  }

 
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Section Header
       offersHeader(context),

        // 🔹 Full-width PageView
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.offers.offers!.items?.length,
            itemBuilder: (context, index) {
              final offer = widget.offers.offers!.items![index];
              return OfferBanner(
                title: offer.name?? '',
                subtitle: offer.description?? '',
                highlightText: '',
                imageUrl: offer.coverUrl?? '',
                currentIndex: _currentIndex,
                total: widget.offers.offers!.items!.length,
              );
            },
          ),
        ),

     //   const SizedBox(height: 8),

        // 🔹 Page Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.offers.offers!.items!.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: index == _currentIndex ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: index == _currentIndex
                    ?AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
