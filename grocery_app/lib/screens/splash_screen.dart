import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/auth.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splashIconSize: 1500,
          duration: 4000,
          splash: Image(
            height: 1500,
            image: AssetImage('assets/logo/gs_logo1.jpg'),
          ),
          nextScreen: Authenticate().handleAuth(),
          splashTransition: SplashTransition.fadeTransition,
          //pageTransitionType: PageTrasitionType.scale,
          backgroundColor: Colors.white,
        ));
  }
}
