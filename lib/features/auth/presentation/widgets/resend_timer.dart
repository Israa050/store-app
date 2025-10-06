
import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/core/themes/styles/styles.dart';

class ResendTimer extends StatelessWidget {
  final int seconds;
  final VoidCallback onResend;

  const ResendTimer({
    super.key,
    required this.seconds,
    required this.onResend,
  });

  bool get canResend => seconds == 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          canResend
              ? 'Didn’t receive the code?'
              : 'Resend available in $seconds s',
          style: AppTextStyles.label,
        ),
        const SizedBox(height: 6),
        TextButton(
          onPressed: canResend ? onResend : null,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Resend Code',
            style: AppTextStyles.label.copyWith(
              color: canResend ? AppColors.primary : AppColors.muted,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
