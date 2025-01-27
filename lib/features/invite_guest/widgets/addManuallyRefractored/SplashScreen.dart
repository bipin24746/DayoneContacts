import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dayonecontacts/features/invite_guest/Pages/HomePage.dart';


import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen.withScreenFunction(
      splash: Text("This is Splash Screen",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      screenFunction: () async {
        return Homepage();
      },
      splashTransition: SplashTransition.fadeTransition,





      // splashTransition: SplashTransition.rotationTransition,
    );

    //   Scaffold(
    //   backgroundColor: Colors.blue,
    //   body: Center(child: Text("This is Splash Screen page"),),
    // );
  }
}
