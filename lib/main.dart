import 'package:covid/screens/News/myth_screen.dart';
import 'package:covid/screens/Shopping/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid/screens/Home2/home2.dart';
import 'package:covid/screens/Health/helpline_screen.dart';
import 'package:covid/screens/FAQ/faq_screen.dart';
import 'package:covid/screens/test centres/test_centers.dart';
import 'package:covid/screens/News/News.dart';
import 'package:flutter/services.dart';
import 'package:covid/screens/Donation/relieffund.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currindex = 0;
  List<Widget> _screens = [
    Home(),
    FaqScreen(),
    News(),
    ProductsScreen(),
    ReliefFund(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
         statusBarColor: Colors.lightBlue[100],
         statusBarIconBrightness: Brightness.dark
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'COVID',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: {
        '/testcentres': (context) => TestCenters(),
        '/myths': (context) => MythScreen(),
        '/helpline':(context) => HelplineScreen()
      },
      home: Scaffold(
        body: _screens[_currindex],
        bottomNavigationBar: Container(
          height: 45.0,
          child: BottomNavigationBar(
            selectedFontSize: 14.0,
            unselectedFontSize: 14.0,
            elevation: 4.0,
            iconSize: 24.0,
            backgroundColor: Colors.lightBlue[50],
            selectedItemColor: Colors.green,
            currentIndex: _currindex,
            onTap: (int index){
              setState((){
                _currindex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.show_chart),
                icon: Icon(Icons.show_chart,color: Colors.black,),
                title: Text('',style: TextStyle(fontSize: 0.0),)
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.face),
                icon: Icon(Icons.face,color: Colors.black,),
                title: Text('',style: TextStyle(fontSize: 0.0))
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.ac_unit),
                icon: Icon(Icons.ac_unit,color: Colors.black,),
                title: Text('',style: TextStyle(fontSize: 0.0))
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.shopping_cart),
                icon: Icon(Icons.shopping_cart,color: Colors.black,),
                title: Text('',style: TextStyle(fontSize: 0.0))
                ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.monetization_on),
                icon: Icon(Icons.monetization_on,color: Colors.black,),
                title: Text('',style: TextStyle(fontSize: 0.0))
              )
            ]
          ),
        ),
      ),
    );
  } 
}