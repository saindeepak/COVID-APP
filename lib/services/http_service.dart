import 'package:http/http.dart';
import 'dart:convert';
import 'package:covid/models/Dailycasesmodel.dart';

class HttpService {
  final String url = 'https://api.covid19india.org/data.json';
  
  Future<List<DailyStatesCases>> getstateinfo() async {
    Response res = await get(url);

    if(res.statusCode == 200){
      var jsondata = jsonDecode(res.body);

      List<dynamic> statewise = jsondata['statewise'] as List;

      List<DailyStatesCases> statecaseslist = statewise.map(
        (item) => DailyStatesCases.fromJson(item)
      ).toList();

      return statecaseslist;
    }
    else{
      throw "Can't fetch data";
    }

  } 
}
