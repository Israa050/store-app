import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/core/helpers/constants.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/helpers/shared_pref_helper.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/features/home/presentation/screens/home_screen.dart';
import 'package:store_app/features/home/presentation/widgets/product_card.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();

  //SharedPrefHelper.clearAllSecuredData();


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
        //home: Test(), 
        initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.onBoardingScreen, 
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}


class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProductCard(),
        ],
      ),
    );
  }
}