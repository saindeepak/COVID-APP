import 'package:flutter/material.dart';

class ManageScreen extends ChangeNotifier {
  bool islogged = false;
  String email = "";

  updateScreen(bool isloggedin){
    if(isloggedin){
      islogged = true;
    }
    notifyListeners();
  }

  useremail(String ismail){
    if(ismail != null){
      email = ismail;
    }
    notifyListeners();
  }

}