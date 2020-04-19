import 'package:flutter/foundation.dart';

class Games {
  final String id;
  final String title;
  final String imageUrl;
  final String url;
  final String rating;
  final String downlaod;

  const Games({
    @required this.id, 
    @required this.title, 
    @required this.imageUrl,
    @required this.url,
    @required this.rating,
    @required this.downlaod,
  });
}