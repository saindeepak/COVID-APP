import '../mainDrawer.dart';
import 'package:flutter/material.dart';

class MythScreen extends StatelessWidget {
  static const routeName = '/myths';

  final List myth = [
    '1. Exposing yourself to the sun or to temperatures higher than 25C degrees DOES NOT prevent the coronavirus disease (COVID-19)',
    '2. You can recover from the coronavirus disease (COVID-19). Catching the new coronavirus DOES NOT mean you will have it for life.',
    '3. Being able to hold your breath for 10 seconds or more without coughing or feeling discomfort DOES NOT mean you are free from the coronavirus disease (COVID-19) or any other lung disease.',
    '4. Drinking alcohol does not protect you against COVID-19 and can be dangerous.',
    '5. COVID-19 virus can be transmitted in areas with hot and humid climates.',
    '6. Cold weather and snow CANNOT kill the new coronavirus.',
    '7. Taking a hot bath does not prevent the new coronavirus disease.',
    '8. The new coronavirus CANNOT be transmitted through mosquito bites.',
    '9. Everyone with COVID-19 dies.',
    '10. Cats and dogs spread coronavirus',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Myths"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'MYTH BUSTERS',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: myth.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(
                  myth[i],
                  overflow: TextOverflow.clip,
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
