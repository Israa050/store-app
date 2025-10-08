import 'dart:async';
import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/offer_model.dart';
import 'offer_banner.dart';

class OffersCarousel extends StatefulWidget {
  final List<OfferModel> offers;
  final Duration autoSlideDuration;

  const OffersCarousel({
    super.key,
    required this.offers,
    this.autoSlideDuration = const Duration(seconds: 4),
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  final PageController _pageController = PageController();
  late Timer _autoSlideTimer;
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

    // 🔁 Start auto-slide timer
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(widget.autoSlideDuration, (timer) {
      if (widget.offers.isEmpty || !_pageController.hasClients) return;

      int nextPage = _currentIndex + 1;
      if (nextPage >= widget.offers.length) nextPage = 0;

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoSlideTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special Offers',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('See All'),
              ),
            ],
          ),
        ),

        // 🔹 Full-width PageView
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.offers.length,
            itemBuilder: (context, index) {
              final offer = widget.offers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: OfferBanner(
                  title: offer.title,
                  subtitle: offer.subtitle,
                  highlightText: offer.highlight,
                  imageUrl: offer.imageUrl,
                  currentIndex: _currentIndex,
                  total: widget.offers.length,
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        // 🔹 Page Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.offers.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: index == _currentIndex ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: index == _currentIndex
                    ? Colors.blueAccent
                    : Colors.blueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
