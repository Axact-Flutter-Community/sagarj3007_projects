import 'package:flutter/cupertino.dart';
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
        backgroundColor: Color(0xfffeb209),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/sj.jpg"),
                radius: 50.0,
              ),
              Text("Sagar Jumrani", style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Lobster',
                color: Colors.white
              ),
              ),
              Text("Be Positive", style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'ArchitectsDaughter',
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
              ),
              SizedBox(height: 10.0,),
              Container(
                width: 200.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Colors.orange[600],
                        Colors.orange[500],
                        Colors.orange[400],
                      ],
                    ),
                  ),
                  width: 300.0,
                  height: 75.0,
                  child: ListTile(
                    leading: Icon(Icons.call, color: Colors.white,),
                    title: Text("+91-9876543210", style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'ArchitectsDaughter',
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Colors.orange[600],
                        Colors.orange[500],
                        Colors.orange[400],
                      ],
                    ),
                  ),
                  width: 300.0,
                  height: 75.0,
                  child: ListTile(
                    leading: Icon(Icons.mail, color: Colors.white,),
                    title: Text("sj@gmail.com", style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'ArchitectsDaughter',
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}