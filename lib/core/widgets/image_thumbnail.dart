
import 'package:flutter/material.dart';

class ImageThumbnail extends StatelessWidget {
  final String url;
  final bool selected;
  final VoidCallback onTap;

  const ImageThumbnail({
    super.key,
    required this.url,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? Theme.of(context).colorScheme.primary
                : const Color(0xFFE9E9EE),
            width: selected ? 2 : 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(url, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
