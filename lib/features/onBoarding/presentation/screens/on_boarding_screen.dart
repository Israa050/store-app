import 'package:flutter/material.dart';
import 'package:store_app/features/onBoarding/presentation/widgets/custom_card.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _imageOpacity;
  late Animation<Offset> _cardOffset;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 2), // duration of the animation
      vsync: this,
    );

    // Fade-in animation for the image
    _imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    // Slide-in animation for the CustomCard
    _cardOffset = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    // Start the animation when the screen is loaded
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onBoarding.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              // Animated Image with fade effect
              FadeTransition(
                opacity: _imageOpacity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/man_on_chair.png'),
                ),
              ),
              
              // Animated CustomCard with slide effect
              Align(
                alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: _cardOffset,
                  child: CustomCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
