import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../mainDrawer.dart';

class Url {
  String url;
  Url({this.url});
}

var urlList = [
  'https://www.practo.com/health-checkup-packages/covid-19-sars-cov-2-detection/p',
  'https://pmnrf.gov.in/en/online-donation',
];

class ReliefFund extends StatelessWidget {
  _launchInBrowser({@required url}) async {
        if (await canLaunch(url)) {
          await launch(
            url,
            forceSafariVC: false,
            forceWebView: false,
            headers: <String, String>{'header_key': 'header_value'},
          );
        } else {
          throw 'Could not launch $url';
        }
      }

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Donate'),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Container(
            height: 450.0,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)
              ),
              color: Colors.lightBlue[50],
              elevation: 15.0,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'To combat the novel coronavirus pandemic, help the Prime Minister with your contribution. All contributions towards PMNRF are exempt from Income Tax under section 80(G) \n Press the button to make donation',
                  style: GoogleFonts.roboto(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Builder(
          builder: (context) => Stack(
            children: <Widget>[
              Positioned(
                top: -115,
                bottom: 70,
                right: 25,
                left: -27,
                child: FabCircularMenu(
                  key: fabKey,
                  alignment: Alignment.bottomRight,
                  ringColor: Colors.black.withOpacity(0.7),
                  ringDiameter: 180.0,
                  ringWidth: 60.0,
                  fabSize: 75.0,
                  fabElevation: 20.0,
                  fabColor: Colors.white,
                  fabCloseColor: Colors.white,                  
                  fabOpenIcon: Icon(Icons.monetization_on, size: 50,),
                  fabCloseIcon: Icon(Icons.close, color: Colors.black),
                  fabMargin: const EdgeInsets.all(12.0),
                  animationDuration: const Duration(milliseconds: 800),
                  animationCurve: Curves.easeInOutCirc,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.settings,color: Colors.lightBlue[100],),
                        onPressed:() => _launchInBrowser(url: urlList[0]),
                        iconSize: 28,
                        color: Colors.white),
                    IconButton(
                        icon: Icon(Icons.widgets,color: Colors.lightBlue[100]),
                        onPressed: () =>_launchInBrowser(url: urlList[1]),
                        iconSize: 28,
                        color: Colors.white)
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
