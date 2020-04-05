import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:lemonade/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FlareControls _controller;
  bool paused = false;

  @override
  void initState() {
    _controller = FlareControls();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FlareActor("assets/animations/splash.flr",
                animation: "Title reveal",
                controller: _controller,
                callback: (anim) {
                  if(anim == "Title reveal") {
                    _controller.play("Wave");
                    Timer(Duration(seconds: 5), () {
                      _controller.play("ProgressBar");
                    });
                    Timer(Duration(seconds: 7), () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => IntroScreen()));
                    });
                  } else if(anim == "Wave") {
                    _controller.play("ProgressBar");
                  }
                },
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}