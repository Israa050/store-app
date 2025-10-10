import 'package:flutter/material.dart';

class SizeOptionChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const SizeOptionChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      pressElevation: 0,
      selectedColor: theme.colorScheme.primary.withOpacity(.12),
      labelStyle: TextStyle(
        color: selected ? theme.colorScheme.primary : const Color(0xFF222222),
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: const Color(0xFFF2F3F5),
    );
  }
}
