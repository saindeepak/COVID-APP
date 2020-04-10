import 'package:flutter/material.dart';

class TopStatus extends StatelessWidget {
  final String data, dataname;
  final Color color;
  TopStatus({this.dataname,this.data,this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 150.0,
      child: Card(
        elevation: 10.0,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(18.0)
        // ),
        child: Center(
          child: Stack(
            children: <Widget>[
               Positioned(
               top: 70,
               right: -20,
               child: Opacity(
                 opacity: 0.6,
                 child: Icon(Icons.ac_unit, color: Colors.black12,size: 100.0,))
               ),
              Positioned(
                top: 20,
                left: 20,
                child: Text(dataname,
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 14.0,
              fontWeight: FontWeight.w700
            ),
            ),
             ),
              Positioned(
                top:50,
                left: 20,
                child: Text(data,
            style: TextStyle(
              color: this.color,
              fontSize: 32.0,
              fontWeight: FontWeight.w700
            ),
            ),
             ),
                        ]
          ),
        ),
      )
    );
  }
}