import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String title;
  final String imageUrl;
  final String url;

  const Product({
    @required this.id, 
    @required this.title, 
    @required this.imageUrl,
    @required this.url,
  });
}
