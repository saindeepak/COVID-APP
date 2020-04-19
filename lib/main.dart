import 'package:covid/screens/AboutUs/aboutus.dart';
import 'package:covid/screens/FAQ/faq_screen.dart';
import 'package:covid/screens/Fun/games_screen.dart';
import 'package:covid/screens/Health/precautions_screen.dart';
import 'package:covid/screens/Landing%20screens/mainscreen.dart';
import 'package:covid/screens/Landing%20screens/splash%20screens/splash_screen.dart';
import 'package:covid/screens/News/myth_screen.dart';
import 'package:covid/screens/login_signup/login.dart';
import 'package:covid/screens/login_signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:covid/screens/Health/helpline_screen.dart';
import 'package:covid/screens/test centres/test_centers.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:covid/StateManagementProviders/providerscreen.dart';
import 'package:covid/screens/Landing screens/openingscreen.dart';

Future<void> main() async{
  runApp(
    ChangeNotifierProvider(
      create: (context) => ManageScreen(),
      child:MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
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
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/faq' : (context) => FaqScreen(),
        '/testcentres': (context) => TestCenters(),
        '/myths': (context) => MythScreen(),
        '/helpline':(context) => HelplineScreen(),
        '/login':(context) => LoginScreen(),
        '/signup':(context) => SignupScreen(),
        '/precautions': (context) => PrecautionsScreen(),
        '/games': (context) => GamesScreen(),
        '/open' : (context) => OpenScreen(),
        '/about' : (context) => AboutUs(),
      },
    );
  }  
}