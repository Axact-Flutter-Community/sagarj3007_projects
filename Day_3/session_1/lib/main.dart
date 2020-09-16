import 'dart:math';
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
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Dice Game"),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: PageDice(),
      ),
    );
  }
}

class PageDice extends StatefulWidget {
  @override
  _PageDiceState createState() => _PageDiceState();
}

class _PageDiceState extends State<PageDice> {

  int dices1=1;
  int dices2=6;
  //int dices3=6;
  //int dices4=6;
  String winner="First Roll The Dice";
  void dice(){
    setState(() {
      dices1=Random().nextInt(6)+1;
      dices2=Random().nextInt(6)+1;
      if(dices1 > dices2){
        winner = "Dice 1";
      }else if(dices1 < dices2){
        winner = "Dice 2";
      }else{
        winner = "Draw";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.0,),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    dice();
                  },
                  child: Image.asset('assets/images/dice$dices1.png'),
                ),
              ),
              SizedBox(width: 50.0,),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    dice();
                  },
                  child: Image.asset('assets/images/dice$dices2.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 50.0,),
          Text('Winner is $winner', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20.0
          ),
          ),
        ],
      ),
    );
  }
}
