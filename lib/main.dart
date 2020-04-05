import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lemonade/screens/main_holder_screen.dart';
import 'package:lemonade/screens/splash_screen.dart';

void main() {

//  runApp(MaterialApp(home: App(),));
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: "Diaria"
    ),
//    home: MainHolderScreen(),
//    home: MainScreen(),
    home: SplashScreen(),
  ));
}



