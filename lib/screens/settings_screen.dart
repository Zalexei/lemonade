import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback menuClicked;

  SettingsScreen({Key key, this.menuClicked}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                          Opacity(opacity: 0, child: Icon(Icons.refresh))
                        ],
                      ),
                    )
                ),
                Expanded(
                  child: Center(
                    child: Text("Settings", style: TextStyle(fontSize: 40),),
                  ),
                )
              ],
            )
        )
    );
  }
}