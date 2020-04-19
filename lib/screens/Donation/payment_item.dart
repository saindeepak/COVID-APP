import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String url;

  PaymentItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.url,
  });

  _launchInBrowser() async {
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
    return InkWell(
      splashColor: Colors.black,
      onTap: _launchInBrowser,
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            color: Colors.blue[50],
            elevation: 4,
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              )
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
