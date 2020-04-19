import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Items extends StatelessWidget {
  final Icon icon;
  final String name;
  final String url;

  Items({this.icon,this.name,this.url});

  _launchInBrowser(String url) async {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.4),width: 0.5),
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.lightBlue[50],
      ),
      child: ListTile(
        leading: icon,
        title: Text(
          '$name',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w500
          ),
          ),
        onTap: (){
          _launchInBrowser(url);
        }
          ,
      ),
    );
  }
}