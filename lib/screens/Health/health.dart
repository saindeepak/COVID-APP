import 'package:flutter/material.dart';

class Health extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Health'),),
        body: Container(
          color: Colors.amber[500],
        ),
      ),
    );
  }
}