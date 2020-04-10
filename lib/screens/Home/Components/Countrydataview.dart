import 'package:flutter/material.dart';

class Countrydata extends StatelessWidget {
  final String active;
  final String confirmed;
  final String deaths;
  final String recovered;
  final String state;

  Countrydata(this.active,this.confirmed,this.deaths,this.recovered,this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Box(confirmed,150.0),
              SizedBox(
                height: 20.0,
              ),
              Box(deaths,90.0)
            ],
          ),
          Column(
            children: <Widget>[
              Box(active,90.0),
              SizedBox(
                height: 20.0,
              ),
              Box(recovered,150.0),
            ],
          )
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  final String data;
  final double height;

  Box(this.data,this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 140.0,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        elevation: 15.0,
        child: Center(
          child: Text(
            '$data'
          ),
        ),
      ),
    );
  }
}