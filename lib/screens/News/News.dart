import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('News'),),
        body: Container(
          color: Colors.orange,
        ),
      ),
    );
  }
}