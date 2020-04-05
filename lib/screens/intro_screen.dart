import 'package:flutter/material.dart';

import 'dart:math' as Math;

import 'package:lemonade/widgets/login_widget.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _pageController;
  double imageOffset = -650;
  double imageOffset2 = 0;
  double dotOffset = 0;
  double signInOpacity = 1.0;

  bool signInDialogShown = false;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        imageOffset = -650 -_pageController.offset / 5;
        imageOffset2 = -_pageController.offset / 2;

        var width = MediaQuery.of(context).size.width;
        double koef = width / 36 * 3;
        dotOffset = _pageController.offset / koef;

        var threeScreens = width * 2;
        signInOpacity = _pageController.offset < (threeScreens) ? 1.0 : Math.max(1 - (_pageController.offset - threeScreens) / width * 2, 0);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
              color: Colors.grey[200],
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  getTopLogo(),
                  getFarthestImage(),
                  getClosestImage(),
                  getPageView(),
                  getBottomRedLine(context),
                  getSignInLabel(context),
                  getPagesSlider(context),
                  if(signInDialogShown) LoginWidget()
                ],
              )),
        ),
      ),
    );
  }

  Widget getClosestImage() {
    return Positioned(
        left: imageOffset2,
        bottom: 80,
        child: Container(
            child: Image.asset("assets/images/newyork.png", width: 1000, color: Colors.black,)
        )
    );
  }

  Widget getFarthestImage() {
    return Positioned(
        left: imageOffset,
        bottom: 80,
        child: Container(
          height: 200,
          child: Opacity(
              opacity: 0.2,
              child: Image.asset("assets/images/buildings.jpg", height: 200, width: 2000,)
          ),
        )
    );
  }

  Widget getTopLogo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Image.asset("assets/images/lemonade_logo.webp", height: 25,),
      ),
    );
  }

  Widget getBottomRedLine(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 5,
        width: MediaQuery
            .of(context)
            .size
            .width,
        color: Colors.redAccent,
      ),
    );
  }

  Widget getSignInLabel(BuildContext context) {
    return Positioned(
      bottom: 55,
      child: Opacity(
        opacity: signInOpacity,
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  signInDialogShown = true;
                });
              },
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: "Already a member? ", style: TextStyle(color: Colors.black)),
                      TextSpan(text: "Sign in", style: TextStyle(color: Colors.redAccent)),
                    ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getPagesSlider(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Center(
          child: Container(
            width: 43,
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: dotOffset,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.red
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PageView getPageView() {
    return PageView(
      controller: _pageController,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 130,),
                    Text("Forget Everything You\nKnow About Insurance", style: TextStyle(fontFamily: "Diara", fontSize: 25), textAlign: TextAlign.center,),
                    SizedBox(height: 30,),
                    Text("Renters and homeowners insurance\npowered by bots and AI", style: TextStyle(fontFamily: "Diaria", fontSize: 17, color: Colors.grey[600]), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 130,),
                    Text("No Brokers,\nKiller Prices", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
                    SizedBox(height: 30,),
                    Text("From \$5 per month for renters,\n\$25 for owners", style: TextStyle(fontSize: 17, color: Colors.grey[600]), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 130,),
                    Text("Instant\nEverything", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
                    SizedBox(height: 30,),
                    Text("90 seconds to start\n3 minutes to file a claim", style: TextStyle(fontSize: 17, color: Colors.grey[600]), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 130,),
                    Text("Instant\nEverything", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
                    SizedBox(height: 30,),
                    Container(
                      width: 240,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Colors.pinkAccent),
                          color: Colors.pinkAccent
                      ),
                      child: Center(child: Text("CHECK OUT OUR PRICES", style: TextStyle(fontSize: 16, color: Colors.white),)),
                    ),
                    SizedBox(height: 15,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          signInDialogShown = true;
                        });
                      },
                      child: Container(
                        width: 240,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Colors.pinkAccent),
                        ),
                        child: Center(child: Text("SIGN IN", style: TextStyle(fontSize: 16, color: Colors.pinkAccent),)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

