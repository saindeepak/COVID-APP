import 'Health/helpline_screen.dart';
import 'News/myth_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid/screens/test centres/test_centers.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 15.0,
      child: Container(
        color: Colors.lightBlue[50],
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text(
                'COVID 19',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile('Myth Busters', Icons.assignment_turned_in, () {
              Navigator.of(context).pushReplacementNamed(MythScreen.routeName);
            }),
            Divider(),
            buildListTile('HelpLine', Icons.add_call, () {
              Navigator.of(context).pushReplacementNamed(HelplineScreen.routeName);
            }),
            Divider(),
            buildListTile('Test Centres', Icons.device_unknown, () {
              Navigator.of(context).pushReplacementNamed(TestCenters.routeName);
            }),
            Divider(),
            // buildListTile('About', Icons.info),
          ],
        ),
      ),
    );
  }
}
