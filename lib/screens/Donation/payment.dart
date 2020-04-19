import 'package:flutter/foundation.dart';

class Payment {
  final String id;
  final String title;
  final String imageUrl;
  final String url;

  const Payment({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.url,
  });
}
