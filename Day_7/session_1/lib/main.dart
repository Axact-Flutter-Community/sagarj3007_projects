import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session1/get_images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Image App", style: GoogleFonts.pacifico(fontSize: 20.0, fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => GetImages()
              ));
            },
            child: Container(
              width: 250.0,
              height: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.grey[900],
                    Colors.orange[800],
                    Colors.orange[400],
                  ],
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(child: Text("Get Images", style: GoogleFonts.caveat(
                fontSize: 32.0, fontWeight: FontWeight.bold,
              ),)),
            ),
          ),
        ),
      ),
    );
  }
}
