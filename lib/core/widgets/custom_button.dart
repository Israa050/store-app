import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/core/themes/styles/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      // enabled ? AppColors.secondary : AppColors.muted.withValues(alpha:  0.6),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.white.withValues(alpha:  0.2), // ✅ splash effect over whole area
        highlightColor: Colors.white.withValues(alpha: 0.1), // ✅ soft press feedback
        child: Container(
          width: double.infinity, // ✅ makes splash cover full width
          padding: const EdgeInsets.symmetric(vertical: 14),
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppTextStyles.button.copyWith(
              color: enabled ? Colors.white : Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
