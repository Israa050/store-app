

import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final String url;
  const HeroImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // nice square
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(url, fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/photo.png');
            },),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.local_fire_department_rounded,
                        size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text('New',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}