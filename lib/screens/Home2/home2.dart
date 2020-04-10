import 'package:flutter/material.dart';
import 'components/TopStatusCards.dart';
import 'package:covid/models/Dailycasesmodel.dart';
import 'package:covid/services/http_service.dart';

class Home extends StatelessWidget {
  final HttpService service = HttpService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          backgroundColor: Colors.lightBlue[50],
          body: FutureBuilder(
            future: service.getstateinfo(),
            builder: (BuildContext context,
                AsyncSnapshot<List<DailyStatesCases>> snapshot) {
              if (snapshot.hasData) {
                List<dynamic> data = snapshot.data;
                var a = data[0];
                data.removeAt(0);
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      delegate: MySliverAppbar(
                        expandedheight: 270.0,
                        active: a.active,
                        confirmed: a.confirmed,
                        deaths: a.deaths,
                        recovered: a.recovered
                        ),
                      // pinned: true,
                      // floating: true,
                    ),
                    SliverList(
                        delegate:
                            SliverChildListDelegate([SizedBox(height: 250.0)])),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Container(
                        child: DataTable(
                          columnSpacing: 25.0,
                          // headingRowHeight: ,
                          columns: [
                            DataColumn(
                                label: Text(
                              'STATE/UT',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.0),
                            )),
                            DataColumn(
                              label: Text(
                                'C',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14.0),
                              ),
                            ),
                            DataColumn(
                                label: Text(
                              'A',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.0),
                            )),
                            DataColumn(
                                label: Text(
                              'R',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.0),
                            )),
                            DataColumn(
                                label: Text(
                              'D',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.0),
                            )),
                          ],
                          rows: data.map(
                            (e) => DataRow(cells: [
                                    DataCell(Text(e.state)),
                                    DataCell(Text(e.confirmed)),
                                    DataCell(Text(e.active)),
                                    DataCell(Text(e.recovered)),
                                    DataCell(Text(e.deaths))
                                  ])
                          ).toList()
                        ),
                      )
                    ]))
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}


class MySliverAppbar extends SliverPersistentHeaderDelegate {
  final double expandedheight;
  final String confirmed;
  final String active;
  final String recovered;
  final String deaths;
  MySliverAppbar({this.expandedheight,this.active,this.confirmed,this.deaths,this.recovered});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(fit: StackFit.expand, overflow: Overflow.visible, children: [
      Image.asset('assets/covid19.jpg', fit: BoxFit.cover),
      Positioned(
          top: expandedheight / 18 - shrinkOffset,
          left: 10.0,
          child: Opacity(
            opacity: 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  // color: Colors.blue[500].withOpacity(shrinkOffset / 500),
                  child: Text(
                    'India Covid-19 Tracker',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('India',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        fontSize: 28.0)),
                SizedBox(height: 10.0),
                Text('Last updated 1 hour ago',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          )),
      Positioned(
        top: expandedheight / 1.5 - shrinkOffset,
        left: 35.0,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TopStatus(data: confirmed, color: Colors.pink, dataname: "Confirmed",),
                  Padding(padding: EdgeInsets.all(5.0)),
                  TopStatus(data: active,  color: Colors.blue, dataname: "Active",),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TopStatus(data: recovered, color: Colors.green, dataname: "Recovered",),
                  Padding(padding: EdgeInsets.all(5.0)),
                  TopStatus(data: deaths, color: Colors.red, dataname: "Deceased",),
                ],
              ),
            ],
          ),
        ),
      )
    ]);
  }

  @override
  double get maxExtent => expandedheight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
