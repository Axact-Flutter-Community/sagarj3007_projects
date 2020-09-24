import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';

class GetImages extends StatefulWidget {
  @override
  _GetImagesState createState() => _GetImagesState();
}

class _GetImagesState extends State<GetImages> {

  List data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchImages();
  }

  Future<String> fetchImages() async{
    var fetchData = await http.get('https://api.unsplash.com/search/photos?per_page=30&client_id=YGDuG1atQkavuIph3DaAmnF8Jk7Cs7NNDzwKQn7_rk0&query=nature');
    var jsonData = json.decode(fetchData.body);
    setState(() {
      data = jsonData['results'];
    });
    return 'Success';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Image App", style: GoogleFonts.pacifico(fontSize: 20.0, fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) => Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0),
                      ),
                      child: Image.network(
                        data[index]['urls']['small'],
                        fit: BoxFit.cover,
                        height: 500.0,
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: 10,
            autoplay: true,
            scale: 0.9,
            viewportFraction: 0.8,
          ),
        ),
      ),
    );
  }
}
