import 'package:flutter/material.dart';
import 'package:covid/screens/Donation/relieffund.dart';
import 'package:covid/screens/News/News.dart';
import 'package:covid/screens/Shopping/products_screen.dart';
import 'package:covid/screens/Home2/home2.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:covid/screens/Nearby%20and%20Location/locationTest.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currindex = 0;
  List<Widget> _screens = [
    Home(),
    LocationTest(),
    News(),
    ProductsScreen(),
    ReliefFund(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _screens[_currindex],
          bottomNavigationBar: Container(
            height: 53.0,
            child: BottomNavigationBar(
              selectedFontSize: 14.0,
              unselectedFontSize: 14.0,
              elevation: 3.0,
              iconSize: 24.0,
              showUnselectedLabels: false,
              backgroundColor: Colors.lightBlue[50],
              selectedItemColor: Colors.green,
              currentIndex: _currindex,
              onTap: (int index){
                setState((){
                  _currindex = index;
                });
              },
              type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(MdiIcons.chartBar),
                  icon: Icon(
                      MdiIcons.chartBar,
                      color: Colors.black,
                    ),
                  title: Text(
                      'Stats',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(MdiIcons.googleNearby),
                  icon: Icon(
                    MdiIcons.googleNearby,
                    color: Colors.black,
                    ),
                  title: Text(
                    'Nearby',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )
                  )
                ),
                BottomNavigationBarItem(
                    activeIcon: Icon(MdiIcons.newspaper),
                    icon: Icon(
                      MdiIcons.newspaper,
                      color: Colors.black,
                    ),
                    title: Text(
                      'News',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.shopping_cart),
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Shop',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.all_inclusive),
                    icon: Icon(
                      Icons.all_inclusive,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Utilities',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ]
            ),
          ),
        ),
    );
  }
}