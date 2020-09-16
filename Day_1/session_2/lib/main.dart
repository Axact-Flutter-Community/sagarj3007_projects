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
        backgroundColor: Colors.orange,
        appBar: AppBar(
          title: Text("Second Session Demo App"),
        ),
        body: Center(
          child: Image(
            image: AssetImage("assests/images/image.jpg"),
          ),
        ),
      ),
    );
  }
}