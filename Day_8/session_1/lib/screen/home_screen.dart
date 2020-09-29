import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/utility.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _enteredCity;

  Future _nextScreen(BuildContext context) async{
    Map results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context){
        return ChangeCity();
      }));
    if(results != null && results.containsKey('enter')){
      _enteredCity = results['enter'];
    }
  }

  void showResult() async{
    Map data = await getWeather(util.apiId, util.defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: (){
              _nextScreen(context);
            }
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset("assets/images/p.jpeg", fit: BoxFit.fill, height: 1200.0,),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Text('${_enteredCity == null ? util.defaultCity : _enteredCity}', style: TextStyle(color: Colors.white, fontSize: 25.0, fontStyle: FontStyle.italic),),
            margin: EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 400.0),
            child: updateTemp(_enteredCity),
          ),
        ],
      ),
    );
  }

  Future<Map> getWeather(String apiId, String city) async{
    String apiUrl ="http://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.apiId}&units=metric";
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  Widget updateTemp(String city){
    return FutureBuilder(
      future: getWeather(util.apiId, city == null ? util.defaultCity : city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
          Map content = snapshot.data;
          return Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("  Temperature : ${content['main']['temp'].toString()} C", style: TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, color: Colors.white,
                  ),),
                  subtitle: ListTile(
                    title: Text(
                        "Humidity : ${content['main']['humidity'].toString()}\n"
                            "Min : ${content['main']['temp_min'].toString()} C\n"
                            "Max : ${content['main']['temp_max'].toString()} C",
                      style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }else{
          return Container();
        }
      });
  }
}

class ChangeCity extends StatelessWidget {

  var _cityFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change City"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset("assets/images/r.jpeg", width: 500.0, height: 1200.0, fit: BoxFit.fill,),
          ),
          ListView(
            children: <Widget>[
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter City Name",
                  ),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: FlatButton(
                  onPressed: (){
                    Navigator.pop(context, {
                      'enter': _cityFieldController.text
                    });
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Get Weather"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
