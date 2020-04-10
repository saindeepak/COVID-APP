import 'package:flutter/material.dart';
import 'package:covid/screens/Home2/home2.dart';
import 'package:covid/screens/FAQ/faq.dart';
import 'package:covid/screens/Health/health.dart';
import 'package:covid/screens/News/News.dart';
import 'package:flutter/services.dart';

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
    Health(),
    News(),
    Faq()
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
                activeIcon: Icon(Icons.question_answer),
                icon: Icon(Icons.question_answer,color: Colors.black,),
                title: Text('',style: TextStyle(fontSize: 0.0))
                ),
            ]
          ),
        ),
      ),
    );
  } 
}