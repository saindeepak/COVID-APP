import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StateData extends StatelessWidget {
  final String active;
  final String confirmed;
  final String deaths;
  final String recovered;
  final String state;

  StateData(this.active,this.confirmed,this.deaths,this.recovered,this.state);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      width: 150.0,
      padding: EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        elevation: 5.0,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('$state',
              style: GoogleFonts.roboto(
                fontSize: 17.0,
              ),
            ),
            Text('Confirmed: $confirmed',
              style: GoogleFonts.roboto(
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      )
    );
  }
}