import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../mainDrawer.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = '/about';

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacementNamed('/home');
        return null;
      },
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "About Us",
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
            drawer: Drawer(
              child: MainDrawer(),
            ),
            body: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                color: Colors.lightBlue[50].withOpacity(0.5),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      height: 300.0,
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        color: Colors.lightBlue[50],
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: Text(

                            'Covid Companion works to provide you with fast, reliable and accurate updates regarding corona virus. Therefore regularly updated news, live updated Statistics, nearby stores and hospitals around you, heath checker to get insight regarding your health and can even book a test and many more.\n Our team of developers ensure you to get all the best possible updates and being a good companion for you in this pandemic situation. ' ,
                            maxLines: 35,
                            style: GoogleFonts.roboto(
                              fontSize: 17.0
                            ),
                            )
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('DEVELOPERS',style: GoogleFonts.roboto(fontSize: 15.0,fontWeight: FontWeight.bold),)),
                        SizedBox(height:10.0),
                        ProfileDev('saindeepak799@gmail.com', 'Deepak Sain','assets/deepak.jpg'),
                        Divider(),
                        ProfileDev('priyamarora0302@gmail.com', 'Priyam Arora','assets/priyam.jpg'),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class ProfileDev extends StatelessWidget {
  final String name;
  final String githublink;
  final String image;

  ProfileDev(this.githublink, this.name,this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[50].withOpacity(0.3),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(          
                backgroundImage: AssetImage('$image',),
                minRadius: 30.0,
                backgroundColor: Colors.lightBlue[100],
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$name',
                    style: GoogleFonts.rockSalt(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        decorationStyle: TextDecorationStyle.wavy),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.mail),
                      SizedBox(width:5.0),
                      Text('$githublink')
                    ],
                  )
                ],
              )
            ],
          ),
          
        ],
      ),
    );
  }
}
