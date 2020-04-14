import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:covid/models/Newsmodel.dart';


class NewsService {
  var url = "https://newsapi.org/v2/everything?q=corona";

  Future<List<NewsModelArticles>> getnews() async {
    Response res = await get(
      url,
      headers: {HttpHeaders.authorizationHeader:"4329f347fc7547b68e6be197f11bd19f"}
    );

    if(res.statusCode==200){
      var jsondata = jsonDecode(res.body);

      List<dynamic> articles = jsondata['articles'] as List;

      List<NewsModelArticles> articleslist = articles.map(
        (item) => NewsModelArticles.fromJson(item)
      ).toList();
      return articleslist;
    }
    else{
      throw 'cant fectch data';
    }
  }
}