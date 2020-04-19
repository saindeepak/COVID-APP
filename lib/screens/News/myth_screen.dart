import '../mainDrawer.dart';
import 'package:flutter/material.dart';

class MythScreen extends StatelessWidget {
  static const routeName = '/myths';

  final List myth = [
    'Exposing yourself to the sun or to temperatures higher than 25 degrees DOES NOT prevent the coronavirus disease.',
    'You can recover from the coronavirus disease. Catching the new coronavirus DOES NOT mean you will have it for life.',
    'Being able to hold your breath for 10 seconds or more without coughing or feeling discomfort DOES NOT mean you are free from the coronavirus disease.',
    'Drinking alcohol does not protect you against COVID-19 and can be dangerous.',
    'COVID-19 virus can be transmitted in areas with hot and humid climates.',
    'Cold weather and snow CANNOT kill the new coronavirus.',
    'Taking a hot bath does not prevent the new coronavirus disease.',
    'The new coronavirus CANNOT be transmitted through mosquito bites.',
    'Everyone with COVID-19 dies.',
    'Cats and dogs spread coronavirus',
    'Garlic protects against coronaviruses',
    'You can catch coronavirus from urine and feces',
    'The virus will die off when temperatures rise in the spring',
    'Flu and pneumonia vaccines protect against COVID-19',
    'The outbreak began because people ate bat soup',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushReplacementNamed('/home');
        return null;
      },
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: MainDrawer(),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Myths",
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
                    itemCount: myth.length,
                    itemBuilder: (ctx, i) => ListTile(
                      leading: Icon(Icons.flare),
                      title: Text(
                        myth[i],
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
      ),
    );
  }
}
