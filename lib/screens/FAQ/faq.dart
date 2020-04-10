import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('FAQ'),),
        body: Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}