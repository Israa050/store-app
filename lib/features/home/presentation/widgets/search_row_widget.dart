
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/features/home/presentation/widgets/custom_icon_button.dart';

class SearchRowWidget extends StatelessWidget {
  const SearchRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 2,
            child: SizedBox(
              height: 50.h,
              width: 275.w,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Color(0xffF5F6FA),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search,),
                  prefixIconColor: AppColors.muted,
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: AppColors.muted,fontSize: 15,fontWeight: FontWeight.w400,),
                ),
              ),
            ),
          ),
      
         customIconButton(),
        ],
      ),
    );
  }
}