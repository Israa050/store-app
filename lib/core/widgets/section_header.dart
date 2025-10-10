import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onTapTrailing;
  final String? trailingText;

  const SectionHeader({
    super.key,
    required this.title,
    this.onTapTrailing,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        const Spacer(),
        if (trailingText != null)
          InkWell(
            onTap: onTapTrailing,
            child: Text(
              trailingText!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
