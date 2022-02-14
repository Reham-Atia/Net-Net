import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:net/modules/home/home_screen.dart';

void main()
{
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/net@net.jpg'),
        ),
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: HomeScreen(),
      ),
    );
  }
}

