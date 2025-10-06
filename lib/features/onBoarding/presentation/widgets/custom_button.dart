import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  String? text;
  Color? color;
  CustomButton({super.key,this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 152,
      decoration: BoxDecoration(
        color: color?? AppColors.primaryPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text?? 'Women',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color:text!= null? Color(0xff8F959E): Colors.white,
          ),
        ),
      ),
    );
  }
}
