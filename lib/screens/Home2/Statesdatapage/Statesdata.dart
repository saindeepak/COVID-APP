import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:covid/services/StatesDistricts_service.dart';
import 'package:covid/models/StatesDistrictwisemodel.dart';

class StatesInfo extends StatelessWidget {
  final stateinfo;
  final DistrictStatesService sev = DistrictStatesService();
  StatesInfo({this.stateinfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stateinfo.state),
      ),
      body: Container(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: FutureBuilder(
              future: sev.getdistrict(),
              builder: (BuildContext context, AsyncSnapshot<List<DistrictStateCases>> snapshot){
                if(snapshot.hasData){
                  List<dynamic> data = snapshot.data;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context,idx){
                      var val = data[idx];
                      return ListTile(
                        title: Text('${val.state}'),
                        // subtitle: val.districtDatar,
                      );
                    },
                  );
                }
                else{
                  return CircularProgressIndicator();
                }
              },
            ),
        ),
      ),
    ),
    );
  }
}