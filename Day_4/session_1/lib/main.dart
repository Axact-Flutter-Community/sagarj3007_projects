import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void playSound(int soundNumber){
    final player=AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber, String text}){
    return Expanded(
      child: FlatButton(
        onPressed: (){
          playSound(soundNumber);
        },
        color: color,
        child: Text(text, style: TextStyle(
          fontFamily: 'ArchitectsDaughter',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.purple, soundNumber: 1, text: "Sound Effect 1"),
              buildKey(color: Colors.indigo, soundNumber: 2, text: "Sound Effect 2"),
              buildKey(color: Colors.blue, soundNumber: 3, text: "Sound Effect 3"),
              buildKey(color: Colors.green, soundNumber: 4, text: "Sound Effect 4"),
              buildKey(color: Colors.yellow, soundNumber: 5, text: "Sound Effect 5"),
              buildKey(color: Colors.orange, soundNumber: 6, text: "Sound Effect 6"),
              buildKey(color: Colors.red, soundNumber: 7, text: "Sound Effect 7"),
            ],
          ),
        ),
      ),
    );
  }
}
