import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/features/onBoarding/presentation/screens/on_boarding_screen.dart';

void main() async{

  await ScreenUtil.ensureScreenSize();
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
    final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Store App',
          theme: ThemeData(
            primaryColor: AppColors.primaryPurple,
            scaffoldBackgroundColor: Colors.white,
          ),
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen(), 
        //initialRoute: Routes.onBoardingScreen, 
        //onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}