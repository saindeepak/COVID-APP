import 'package:covid/screens/Landing%20screens/mainscreen.dart';
import 'package:covid/screens/login_signup/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpenScreen extends StatefulWidget {
  @override
  _OpenScreenState createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  bool log = false;

  getloggedinflag() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool login = pref.getBool('isloggedin')??false;
    setState(() {
      log = login;
    });
    return login;
  }


  void initState()  {
    super.initState();
    getloggedinflag();
  }

  @override
  Widget build(BuildContext context) {
     return (log) ? HomeScreen() : LoginScreen();
  }  
}
