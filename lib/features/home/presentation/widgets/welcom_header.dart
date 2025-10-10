
import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';

class WelcomHeader extends StatelessWidget {
  const WelcomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
              'Hello',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
        
            Text(
              'Welcome to Laza.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.muted,
                
              ),
              textAlign: TextAlign.start,
            ),
        
        ],
      ),
    );
  }
}