

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'font_weight_helper.dart';

// class TextStyles {

//    static TextStyle base({
//     required double size,
//     required FontWeight fontWeight,
//     required Color color,
//   }) {
//     return GoogleFonts.raleway(
//       fontSize: size,
//       fontWeight: fontWeight,
//       color: color,
//     );
//   }

//   static TextStyle font24DarkPurpuleBold =
//       base(size: 24, fontWeight: FontWeightHelper.bold, color: AppColors.darkPurple);

//   static TextStyle font14WhiteBold =
//       base(size: 14, fontWeight: FontWeightHelper.bold, color: Colors.white); 

//   static TextStyle font12BlackSemiBold =
//       base(size: 12, fontWeight: FontWeightHelper.semiBold, color: Colors.black); 

//   static TextStyle font14DarkPurpleBold =
//       base(size: 14, fontWeight: FontWeightHelper.bold, color: AppColors.darkPurple); 

//   static TextStyle font12GreyMedium =
//       base(size: 12, fontWeight: FontWeightHelper.medium, color: AppColors.grey); 
      
//   static TextStyle font16DarkPurpleSemiBold =
//       base(size: 16, fontWeight: FontWeightHelper.semiBold, color: AppColors.darkPurple);          

//   static TextStyle font14GreySemiBold =
//       base(size: 14, fontWeight: FontWeightHelper.semiBold, color: AppColors.grey);      

//   static TextStyle font14WhiteSemiBold =
//       base(size: 14, fontWeight: FontWeightHelper.semiBold, color: Colors.white);

//   static TextStyle font13WhiteMedium =
//       base(size: 13, fontWeight: FontWeightHelper.medium, color: Colors.white); 

//   static TextStyle font14WhiteRegular =
//       base(size: 14, fontWeight: FontWeightHelper.regular, color: Colors.white);          

//   static TextStyle font14WhiteMedium =
//       base(size: 14, fontWeight: FontWeightHelper.medium, color: Colors.white);    

//    static TextStyle font22DarkPurpleBold =
//       base(size: 22, fontWeight: FontWeightHelper.bold, color: AppColors.darkPurple); 

//    static TextStyle font16WhiteBold =
//       base(size: 16, fontWeight: FontWeightHelper.bold, color: Colors.white);

//    static TextStyle font12LightPurpleBold =
//       base(size: 12, fontWeight: FontWeightHelper.bold, color: AppColors.light);                                       

// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';


class AppTextStyles {
  static TextStyle heading = GoogleFonts.openSans(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  static TextStyle label = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.muted,
  );

  static TextStyle input = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );

  static TextStyle button = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
