import 'package:flutter/material.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/onBoarding/presentation/widgets/custom_button.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244,
      width: 370,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Look Good, Feel Good',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
    
           Text(
            'Create your individual & unique style and\n look amazing everyday.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              CustomButton(
                text: 'Men',
                color: Colors.white,
              ),

              CustomButton(),

            ],
          ),

          InkWell(
            onTap: () => context.pushNamed(Routes.loginScreen),
            child: Text(
              'Skip',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: Color(0xff8F959E,),),
            ),
          ),

        ],
      ),
    );
  }
}
