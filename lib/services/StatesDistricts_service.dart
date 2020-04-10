import 'package:covid/models/StatesDistrictwisemodel.dart';
import 'package:http/http.dart';
import 'dart:convert';
// import 'package:covid/models/StatesDistrictwisemodel.dart';

class DistrictStatesService {
  final String url = 'https://api.covid19india.org/v2/state_district_wise.json';

  Future<List<DistrictStateCases>> getdistrict() async {
    Response res = await get(url);

    if(res.statusCode == 200){
      var jsondata = jsonDecode(res.body);

      List<dynamic> maps = jsondata.cast();

      List<DistrictStateCases> districtcases = maps.map(
        (item) => DistrictStateCases.fromJson(item)
      ).toList();

      return districtcases;
    }
    else{
      throw 'cant get the data';
    }
  }
}