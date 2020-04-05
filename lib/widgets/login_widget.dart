import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lemonade/helpers/helpers.dart';
import 'package:lemonade/helpers/slide_route.dart';
import 'package:lemonade/screens/main_holder_screen.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController _emailController, _passwordController;
  Color loginButtonColor = Colors.grey;
  bool updating = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailController.addListener(() {
      setLoginButtonColor();
    });
    _passwordController.addListener(() {
      setLoginButtonColor();
    });
    super.initState();
  }

  setLoginButtonColor() {
    bool validInput = _emailController.text.length > 0 && _passwordController.text.length > 0;

    setState(() {
      loginButtonColor = validInput ? Colors.redAccent : Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(170),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              height: 371,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.blue[800],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesome.facebook_official, color: Colors.white, size: 40,),
                                Expanded(
                                  child: Center(
                                    child: Text("Login with Facebook", style: TextStyle(fontSize: 18, color: Colors.white),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(color: Colors.grey[200], height: 1,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                            child: Text("OR", style: TextStyle(color: Colors.grey[400]),),
                          ),
                          Expanded(
                            child: Container(color: Colors.grey[200], height: 1,),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.grey[300])
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                            child: TextField(
                              controller: _emailController,
                              decoration: new InputDecoration(
                                  filled: true,
                                  border: InputBorder.none,
                                  labelStyle: new TextStyle(color: Colors.grey[300], fontSize: 13),
                                  labelText: "EMAIL",
                                  fillColor: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.grey[300])
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: new InputDecoration(
                                  filled: true,
                                  border: InputBorder.none,
                                  labelStyle: new TextStyle(color: Colors.grey[300], fontSize: 13),
                                  alignLabelWithHint: false,
                                  labelText: "PASSWORD",
                                  fillColor: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 10, bottom: 20),
                        child: Text("Forgot password?", style: TextStyle(color: Colors.redAccent),),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          updating = true;
                        });
                        await Future.delayed(Duration(milliseconds: 1200));
                        hideKeyboard(context);
                        await Future.delayed(Duration(milliseconds: 200));
                        Navigator.pushReplacement(context, SlideRightRoute(page: MainHolderScreen()));
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOutQuad,
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                            color: loginButtonColor
                        ),
                        child: Center(
                          child: updating ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 1, valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))
                          ) : Text("LOGIN", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              height: 50,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {

                    });
                  },
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: "New member? ", style: TextStyle(color: Colors.white)),
                          TextSpan(text: "Sign up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ]
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
