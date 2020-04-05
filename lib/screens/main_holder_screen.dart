import 'package:flutter/material.dart';
import 'package:lemonade/screens/chat_screen.dart';
import 'package:lemonade/screens/settings_screen.dart';

enum Page {
  chat,
  settings
}

class MainHolderScreen extends StatefulWidget {
  MainHolderScreen({Key key}) : super(key: key);

  @override
  _MainHolderScreenState createState() => _MainHolderScreenState();
}

class _MainHolderScreenState extends State<MainHolderScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> scaleAnimation;
  Animation<double> slideAnimation;

  Page currentPage = Page.chat;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this
    )
    ..addListener(() {
      setState(() {

      });
    });

    scaleAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(_controller);
    slideAnimation = Tween<double>(begin: 0, end: -180).animate(_controller);

    //_controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double scale = scaleAnimation.value;

    Widget page = null;
    switch(currentPage) {
      case Page.chat:
        page = ChatScreen(menuClicked: () => _controller.forward(),);
        break;
      case Page.settings:
        page = SettingsScreen(menuClicked: () => _controller.forward(),);;
        break;
    }

    return Scaffold(
        body: Container(
          color: Colors.grey[700],
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                    right: slideAnimation.value,
                    child: GestureDetector(
                      onTap: () => _controller.reverse(),
                      child: Container(
                        width: width,
                        height: height - MediaQuery.of(context).viewInsets.bottom,
                        child: AbsorbPointer(
                          absorbing: false,
                            child: Transform.scale(child: page, scale: scale, )
                        ),
                      ),
                    )
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: height * 0.3,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              currentPage = Page.settings;
                            });
                            _controller.reverse();
                          },
                            child: Text("Settings", style: TextStyle(color: Colors.white, fontSize: 20),)
                        ),
                        SizedBox(height: 16,),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                currentPage = Page.chat;
                              });
                              _controller.reverse();
                            },
                            child: Text("Chat", style: TextStyle(color: Colors.white, fontSize: 20),)
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
        )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}