import 'package:flutter/material.dart';
import '../mainDrawer.dart';

class HelplineScreen extends StatelessWidget {
  static const routeName = '/helpline';

  Widget bodyData() => DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              'STATE/UT',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            numeric: false,
          ),
          DataColumn(
            label: Text(
              'HelpLine Number',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        rows: names
            .map(
              (element) => DataRow(
                cells: <DataCell>[
                  DataCell(
                    Container(
                      width: 150,
                      child: Text(
                        element.name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  
                  DataCell(
                    Container(
                      width: 150,
                      child: Text(
                        element.number,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Helpline Numbers"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Text(
                'Central Helpline Number for corona-virus: +91-11-23978046',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Helpline Numbers of States/UTs',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                child: bodyData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Name {
  String name;
  String number;
  Name({this.name, this.number});
}

var names = <Name>[
  Name(name: "Andaman and Nicobar Islands ", number: "03192 - 232102"),
  Name(name: "Andhra Pradesh ", number: "0866 - 2410978"),
  Name(name: "Arunachal Pradesh ", number: "9436055743"),
  Name(name: "Assam", number: "6913347770"),
  Name(name: "Bihar", number: "104"),
  Name(name: "Chandigarh", number: "9779558282"),
  Name(name: "Chhattisgarh", number: "104"),
  Name(name: "Dadra and Nagar Haveli and Daman & Diu", number: "104"),
  Name(name: "Delhi", number: "011 - 22307145"),
  Name(name: "Goa", number: "104"),
  Name(name: "Gujarat", number: "104"),
  Name(name: "Haryana", number: "8558893911"),
  Name(name: "Himachal Pradesh", number: "104"),
  Name(name: "Jammu & Kashmir", number: "01912520982"),
  Name(name: "Jharkhand", number: "104"),
  Name(name: "Karnataka", number: "104"),
  Name(name: "Kerala", number: "0471 - 2552056"),
  Name(name: "Ladakh", number: "01982256462"),
  Name(name: "Lakshadweep", number: "104"),
  Name(name: "Madhya Pradesh", number: "104"),
  Name(name: "Maharashtra", number: "020 - 26127394"),
  Name(name: "Manipur", number: "3852411668"),
  Name(name: "Meghalaya", number: "108"),
  Name(name: "Mizoram", number: "102"),
  Name(name: "Nagaland", number: "7005539653"),
  Name(name: "Odisha", number: "9439994859"),
  Name(name: "Puducherry", number: "104"),
  Name(name: "Punjab", number: "104"),
  Name(name: "Rajasthan", number: "0141 - 2225624"),
  Name(name: "Sikkim", number: "104"),
  Name(name: "Tamil Nadu", number: "044 - 29510500"),
  Name(name: "Telangana", number: "104"),
  Name(name: "Tripura", number: "0381 - 2315879"),
  Name(name: "Uttarakhand", number: "104"),
  Name(name: "Uttar Pradesh", number: "18001805145"),
  Name(name: "West Bengal", number: "1800313444222"),
];
