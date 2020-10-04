import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/article_model.dart';

class News{
  List<ArticleModel> news=[];

  Future<void> getNews() async{
    String url="http://newsapi.org/v2/top-headlines?country=in&apiKey=bb56051d2e374106a758954374c6b4d7";
    var response= await http.get(url);
    var jsonData= jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element['description'] != null){
          ArticleModel articleModel=ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}



class CategoryNews{
  List<ArticleModel> news=[];

  Future<void> getNews(String category) async{
    String url="http://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=bb56051d2e374106a758954374c6b4d7";
    var response= await http.get(url);
    var jsonData= jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element['description'] != null){
          ArticleModel articleModel=ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}