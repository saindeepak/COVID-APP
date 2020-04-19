import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String url;
  final String rating;
  final String available;
  
  ProductItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.url,
    @required this.rating,
    @required this.available,
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
      onTap: _launchInBrowser, 
      child: Card(
        color: Colors.lightBlue[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  child: Image.asset(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black54,
                          Colors.black38,
                          Colors.black12
                        ],
                        stops: [0.25,0.45,0.65,0.85]
                      )
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Colors.lightBlue[100],
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.grey.withOpacity(0.4),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  // We will have multiple widgets side by side
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      // each widget will have further widgets in it side by side.
                      children: <Widget>[
                        Icon(Icons.star),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          rating,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.archive),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          available,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
