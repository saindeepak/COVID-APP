import 'package:flutter/foundation.dart';

class NewsModelArticles{
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String source;

  NewsModelArticles({
    @required this.author,
    @required this.description,
    @required this.url,
    @required this.urlToImage,
    @required this.title,
    @required this.publishedAt,
    @required this.content,
    @required this.source,
  });

  factory NewsModelArticles.fromJson(Map<String,dynamic> parsedjson){
    Map<String,dynamic> src = parsedjson['source'];
    return NewsModelArticles(
      author: parsedjson['author'], 
      description: parsedjson['description'], 
      url: parsedjson['url'], 
      urlToImage: parsedjson['urlToImage'], 
      title: parsedjson['title'], 
      publishedAt: parsedjson['publishedAt'], 
      content: parsedjson['content'],
      source: src['name'],
    );
  }
}

