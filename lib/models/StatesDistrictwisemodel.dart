import 'package:flutter/foundation.dart';

class DistrictStateCases{
  final String state;
  final List<District> districtData;
  
  DistrictStateCases({
    @required this.state,
    @required this.districtData
  });

  factory DistrictStateCases.fromJson(Map<String,dynamic> jsondata){
    List<dynamic> distlist = jsondata['districtData'] as List;
    List<District> dist = distlist.map(
      (item) => District.fromJson(item)
    ).toList(); 
    return DistrictStateCases(
      state: jsondata['state'] ,
      districtData: dist
    );
  }
}

class District {
  final String district;
  final int confirmed;

  District({
    @required this.confirmed,
    @required this.district
  });

  factory District.fromJson(Map<String,dynamic> parsedjson){
    return District(
      district: parsedjson['district'],
      confirmed: parsedjson['confirmed']
    );
  }
}