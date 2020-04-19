import '../mainDrawer.dart';
import 'package:flutter/material.dart';

class PrecautionsScreen extends StatelessWidget {
  static const routeName = '/precautions';

  final List precautions = [
    'Avoid close contact with people who are sick. Maintain at least three feet distance between yourself and anyone who is coughing or sneezing.',
    'Avoid touching your eyes, nose, and mouth.',
    'Stay home when you are sick.',
    'Cover your cough or sneeze with a tissue, then dispose of the tissue safely.',
    'Clean and disinfect frequently-touched objects and surfaces using a regular household cleaning spray or wipe.',
    'Wash your hands often with soap and water for at least 20 seconds, especially after going to the bathroom, before eating, and after blowing your nose.',
    'Wearing a mask is not necessary unless you are taking care of an infected person.',
    'If soap and water are not readily available, use an alcohol-based hand sanitiser with at least 60% alcohol.',
    'Always wash hands with soap and water when hands are visibly dirty.',
    'If you have a fever, cough and difficulty breathing, seek medical attention immediately.',
    'Keep in mind the travel advisory set out by the Ministry of Health and Welfare.',
    'Call a medical professional as soon as COVID-19 symptoms start, if you are at higher risk.',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushReplacementNamed('/home');
        return null;
      },
      child: Scaffold(
        drawer: Drawer(
          child: MainDrawer(),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Precautions",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[100],
                  Colors.blue[200],
                  Colors.blue[300],
                  Colors.blue[400]
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.grey.withOpacity(0.2),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: precautions.length,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: Icon(Icons.flare),
                    title: Text(
                      precautions[i],
                      overflow: TextOverflow.clip,
                      maxLines: 5,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
