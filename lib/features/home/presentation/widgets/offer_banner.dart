import 'package:flutter/material.dart';

class OfferBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String highlightText;
  final String imageUrl;
  final int currentIndex;
  final int total;
  final ValueChanged<int>? onPageChanged;

  const OfferBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.highlightText,
    required this.imageUrl,
    this.currentIndex = 0,
    this.total = 3,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        children: [
          // 🔹 Banner Container
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.orange.shade400,
              ),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  // 🔸 Background Decoration (optional curved shapes)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Colors.orange.shade300.withOpacity(0.8),
                            Colors.orange.shade200.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ),
      
                  // 🔸 Text Area
                  Positioned(
                    left: 20,
                    top: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          highlightText,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
      
                  // 🔸 Image
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Image.asset(
                      'assets/images/man_on_chair.png',
                      fit: BoxFit.cover,
                      width: 160,
                    ),
                  ),
                ],
              ),
            ),
          ),
      
          const SizedBox(height: 12),
      
          
        ],
      ),
    );
  }
}
