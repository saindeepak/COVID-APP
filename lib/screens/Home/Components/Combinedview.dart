import 'package:flutter/material.dart';
import 'package:covid/models/Dailycasesmodel.dart';
import 'Statesdataview.dart';
import 'package:covid/services/http_service.dart';
import 'Countrydataview.dart';
import 'package:covid/screens/Home2/Statesdatapage/Statesdata.dart';

class HomePage extends StatelessWidget {
  final HttpService service = HttpService();

  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          height: 350.0,
          child: FutureBuilder(
            future: service.getstateinfo(),
            builder: (BuildContext context, AsyncSnapshot<List<DailyStatesCases>> snapshot){
              if(snapshot.hasData){
                List<dynamic> data = snapshot.data;
                return Countrydata(data[0].active, data[0].confirmed, data[0].deaths, data[0].recovered, data[0].state);
              }
              else{
                return Center(
                  child: CircularProgressIndicator()
                );
              }
            },
          ),
        ),
         Container(
          height: 200.0,
          child: FutureBuilder(
            future: service.getstateinfo(),
            builder: (BuildContext context, AsyncSnapshot<List<DailyStatesCases>> snapshot){
              if(snapshot.hasData){
                List<dynamic> data = snapshot.data;
                  return ListView.builder(
                    itemCount: data.length,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int idx){
                      var val = data[idx];
                      if(idx != 0){
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => StatesInfo(stateinfo: val)
                              )
                            );
                          },
                          child: StateData(val.active, val.confirmed, val.deaths, val.recovered, val.state)
                          );
                      }
                      else{
                        return SizedBox(width: 20.0,);
                      }
                    }, 
                  );
              }
              else{
                return Center(child: CircularProgressIndicator());
              }
          },
          ),
        ),
      ],
    );
  }
}
