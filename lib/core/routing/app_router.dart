
import 'package:flutter/material.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/auth/presentation/screens/login_screen.dart';
import 'package:store_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:store_app/features/auth/presentation/screens/verification_screen.dart';
import 'package:store_app/features/onBoarding/presentation/screens/on_boarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
         return MaterialPageRoute(builder: (_)=> const LoginScreen());

      case Routes.signUpScreen:
         return MaterialPageRoute(builder: (_)=> const SignUpScreen());

      case Routes.verifyAccount:
          return MaterialPageRoute(builder: (_)=> const VerificationScreen());        

    }
    return null;
  }
}