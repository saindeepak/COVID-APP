import 'package:flutter/foundation.dart';

class DailyStatesCases{
  final String active;
  final String confirmed;
  final String deaths;
  final String recovered;
  final String state;

  DailyStatesCases({
    @required this.active,
    @required this.confirmed,
    @required this.deaths,
    @required this.state,
    @required this.recovered
  });

  factory DailyStatesCases.fromJson(Map<String,dynamic> jsondata){
    return DailyStatesCases(
      state: jsondata['state'] ,
      active: jsondata['active'] ,    
      confirmed: jsondata['confirmed'] ,
      deaths: jsondata['deaths'],
      recovered: jsondata['recovered'],
    );
  }
}

