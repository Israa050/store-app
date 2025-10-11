import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget errorWiget(IconData? icon, String title) {
  return Center(
    child: SizedBox(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         // Icon(icon?? Icons.error, size: 100, color: Colors.red),
         SizedBox(height: 150,width: 150,child: SvgPicture.asset('assets/svgs/undraw_cancel_7zdh.svg')),
          Text(
            'Opps! Something Went Wrong!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
