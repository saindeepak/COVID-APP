import 'package:covid/screens/Fun/games_screen.dart';
import 'package:covid/screens/Health/precautions_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AboutUs/aboutus.dart';
import 'Health/helpline_screen.dart';
import 'News/myth_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid/screens/test centres/test_centers.dart';
import 'package:covid/screens/FAQ/faq_screen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String usermail;
  setloggedinflag() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isloggedin', false);
  }

  getemail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String mail = pref.getString('email');
    print('**** before ************ usermail: $usermail');
    setState(() {
      usermail = mail;
    });
    print('** after ************** usermail: $usermail');
    return mail;
  }

  void initState() {
    super.initState();
    getemail();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: SafeArea(
        child: Drawer(
          elevation: 15.0,
          child: Container(
            color: Colors.blueAccent[50],
            child: Column(
              children: <Widget>[
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.blue[100],
                    Colors.blue[300],
                    Colors.blue[400],
                  ])),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 38.0,
                        left: 15.0,
                        child: Text(
                          'USER:',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15.0,
                              color: Colors.black),
                        ),
                      ),
                      Positioned(
                        bottom: 20.0,
                        left: 15.0,
                        child: Text(
                    '$usermail',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15.0,
                        color: Colors.purple),
                  ),
                        ),
                      Positioned(
                        bottom: 30.0,
                        right: 15.0,
                        child: IconButton(
                        icon: Icon(Icons.exit_to_app),
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            setloggedinflag();
                            Navigator.of(context)
                                .pushReplacementNamed('/login');
                          }).catchError((e) {
                            print(e);
                          });
                        })
                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 25.0,
                        child: Text('LOG OUT',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold
                          ),
                        ),)
                    ],
                  ),
                ),
                // UserAccountsDrawerHeader(
                //   decoration: BoxDecoration(
                //       gradient: LinearGradient(colors: [
                //     Colors.blue[100],
                //     Colors.blue[300],
                //     Colors.blue[400],
                //   ])),
                //   accountName: Text(
                //     'USER',
                //     style: TextStyle(
                //         fontFamily: 'Roboto',
                //         fontSize: 15.0,
                //         color: Colors.black),
                //   ),
                  // accountEmail: Text(
                  //   '$usermail',
                  //   style: TextStyle(
                  //       fontFamily: 'Roboto',
                  //       fontSize: 15.0,
                  //       color: Colors.black),
                  // ),
                //   otherAccountsPictures: <Widget>[
                    // Text('log out'),
                    
                //   ],
                // ),
                buildListTile('FAQs', Icons.question_answer, () {
                  Navigator.of(context)
                      .pushReplacementNamed(FaqScreen.routeName);
                }),
                Divider(),
                buildListTile('Myth Busters', MdiIcons.bookInformationVariant,
                    () {
                  Navigator.of(context)
                      .pushReplacementNamed(MythScreen.routeName);
                }),
                Divider(),
                buildListTile('Precautions', MdiIcons.plusBox, () {
                  Navigator.of(context)
                      .pushReplacementNamed(PrecautionsScreen.routeName);
                }),
                Divider(),
                buildListTile('Test Centres', MdiIcons.ambulance, () {
                  Navigator.of(context)
                      .pushReplacementNamed(TestCenters.routeName);
                }),
                Divider(),
                buildListTile('HelpLine', MdiIcons.phoneInTalk, () {
                  Navigator.of(context)
                      .pushReplacementNamed(HelplineScreen.routeName);
                }),
                Divider(),
                buildListTile('Fun', MdiIcons.gamepadVariant, () {
                  Navigator.of(context)
                      .pushReplacementNamed(GamesScreen.routeName);
                }),
                Divider(),
                buildListTile('About', MdiIcons.information, () {
                  Navigator.of(context).pushReplacementNamed(AboutUs.routeName);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildListTile(String title, IconData icon, Function tabHandler) {
  return Container(
    height: 40.0,
    child: ListTile(
      // contentPadding: EdgeInsets.all(10.0),
      leading: Icon(
        icon,
        color: Colors.brown,
        size: 25.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.teal,
          fontSize: 18,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tabHandler,
    ),
  );
}
