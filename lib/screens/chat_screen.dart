import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final VoidCallback menuClicked;

  ChatScreen({Key key, this.menuClicked}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  double opacityOverlayAddresses = 0.0;
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
              children: <Widget>[
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey[300]))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            widget.menuClicked();
                          },
                          child: Icon(Icons.menu)
                        ),
                        Expanded(
                          child: Container(child: Center(child: Image.asset("assets/images/lemonade_logo.webp", height: 25,))),
                        ),
                        Icon(Icons.refresh)
                      ],
                    ),
                  )
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: ListView(
                          reverse: true,
                          physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 60,
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage("assets/images/greta.jpeg"),
                                        radius: 17,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                        ),
                                        color: Colors.grey[200],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("To start, I'll need your home address", style: TextStyle(fontSize: 16),),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 60,),
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                        ),
                                        color: Colors.grey[200],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("Hi Alexey! :)", style: TextStyle(fontSize: 16),),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Align(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/greta.jpeg"),
                                    radius: 70,
                                  ),
                                  SizedBox(height: 30,),
                                  Text("Greta", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: 130,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Icon(Icons.star, color: Colors.redAccent,),
                                        Icon(Icons.star, color: Colors.redAccent,),
                                        Icon(Icons.star, color: Colors.redAccent,),
                                        Icon(Icons.star, color: Colors.redAccent,),
                                        Icon(Icons.star, color: Colors.redAccent,),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("Personal Ecological Assistant", style: TextStyle(fontSize: 17, color: Colors.grey[500])),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
                Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey[300])),
                      color: Colors.grey[50]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.grey[500], width: 1.2),
                          color: Colors.white
                        ),
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: _controller,
//                            autofocus: true,
                            onChanged: (val) {
                              setState(() {
                                opacityOverlayAddresses = val.length > 0 ? 1.0 : 0.0;
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hasFloatingPlaceholder: false,
                              hintText: "STREET ADDRESS, CITY, STATE",
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                      ),
                    )
                )
              ],
            )
        )
    );
  }
}