import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            color: Colors.teal,
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 100.0,
                  color: Colors.red,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 100.0,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.blue,
                  width: 100.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
