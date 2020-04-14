import 'package:flutter/material.dart';
import '../mainDrawer.dart';

class TestCenters extends StatelessWidget {
  static const routeName = '/testcentres';
  Widget bodyData() => DataTable(
    columnSpacing: 28.0,
    dataRowHeight: 80.0,
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              'States',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            numeric: false,
          ),
          DataColumn(
            label: Text(
              'Test Centres',
              style: TextStyle(
                fontSize: 16,
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
                      width: 100,
                      child: Text(
                        element.name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 200,
                      child: Text(
                        element.centre,
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
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Test Centres"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              Text(
                'Test Centres in India',
                style: TextStyle(
                  fontSize: 18,
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
  String centre;
  Name({this.name, this.centre});
}

var names = <Name>[
  Name(
      name: "Andaman and Nicobar Islands ",
      centre: "1. GMC, Anantapur\n2. Regional Medical Research Centre"),
  Name(
      name: "Andhra Pradesh ",
      centre:
          "1. Sri Venkateswara Institute of Medical Sciences\n2. Andhra Medical College"),
  Name(
      name: "Assam",
      centre:
          "1. Gauhati Medical College\n2. Regional Medical Research Center"),
  Name(
      name: "Bihar",
      centre: "1. Rajendra Memorial Research Institute of Medical Sciences"),
  Name(
      name: "Chandigarh",
      centre: "1. Post Graduate Institute of Medical Education & Research"),
  Name(name: "Chhattisgarh", centre: "1. All India Institute Medical Sciences"),
  Name(
      name: "Delhi",
      centre:
          "1. All India Institute Medical Sciences\n2. National Centre for Disease Control"),
  Name(
      name: "Gujarat",
      centre: "1. BJ Medical College\n2. M.P.Shah Government Medical College"),
  Name(
      name: "Haryana",
      centre:
          "1. Pt. B.D. Sharma Post Graduate Inst. of Med. Sciences\n2. BPS Govt Medical College"),
  Name(
      name: "Himachal Pradesh",
      centre:
          "1. Indira Gandhi Medical College\n2. Dr.Rajendra Prasad Govt. Med. College"),
  Name(
      name: "Jammu & Kashmir",
      centre:
          "1. Sher-e- Kashmir Institute of Medical Sciences\n2. Government Medical College"),
  Name(name: "Jharkhand", centre: "1. MGM Medical College"),
  Name(
      name: "Karnataka",
      centre:
          "1. Bangalore Medical College & Research Institute\n2. National Institute of Virology Field Unit"),
  Name(
      name: "Kerala",
      centre:
          "1. National Institute of Virology Field Unit\n2. Govt. Medical College"),
  Name(
      name: "Madhya Pradesh",
      centre:
          "1. All India Institute Medical Sciences\n2. National Institute of Research in Tribal Health (NIRTH)"),
  Name(
      name: "Maharashtra",
      centre:
          "1. Indira Gandhi Government Medical College\n2. Kasturba Hospital for Infectious Diseases"),
  Name(name: "Meghalaya", centre: "1. NEIGRI of Health and Medical Sciences"),
  Name(name: "Odisha", centre: "1. Regional Medical Research Center"),
  Name(
      name: "Puducherry",
      centre:
          "1. Jawaharlal Institute of Postgraduate Medical Education & Research"),
  Name(
      name: "Punjab",
      centre: "1. Government Medical College\n2. Government Medical College"),
  Name(
      name: "Rajasthan",
      centre: "1. Sawai Man Singh\n2. Dr. S.N Medical College"),
  Name(
      name: "Tamil Nadu",
      centre:
          "1. King's Institute of Preventive Medicine & Research\n2. Government Medical College"),
  Name(name: "Telangana", centre: "1. Gandhi Medical College"),
  Name(name: "Tripura", centre: "1. Government Medical College"),
  Name(name: "Uttarakhand", centre: "1. Government Medical College"),
  Name(
      name: "Uttar Pradesh",
      centre:
          "1. King's George Medical University\n2. Institute of Medical Sciences, Banaras Hindu University"),
  Name(
      name: "West Bengal",
      centre: "1. National Institute of Cholera and Enteric Diseases"),
];
