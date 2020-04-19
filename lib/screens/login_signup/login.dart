import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  var password;

  setisloggedinflag() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isloggedin',true);
  }

  setemail(String mail) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email',mail);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.0,),
                Center(
                  child: Text(
                    'Login',
                    style: GoogleFonts.roboto(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20.0),
                //email field
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'E-mail',
                      style: kLabelStyle,
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      child: TextField(
                        keyboardAppearance: Brightness.light,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(Icons.email, color: Colors.black),
                          hintText: 'E-mail here',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.0),

                //password 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Password',
                      style: kLabelStyle,
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                         onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          hintText: 'Password here',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                //button
                Container(
                  height: 45.0,
                  width: 250.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    color: Colors.black,
                    splashColor: Colors.white.withOpacity(0.4),
                    onPressed: (){
                      if(email != null && password != null){
                        FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password)
                          .then((user) {
                          setisloggedinflag();
                          setemail(email);
                          Navigator.of(context).pushReplacementNamed('/home');
                            }).catchError((e) {
                            print(e);
                        });
                      }
                    },
                    child: Center(
                      child: Text(
                            'LOG-IN',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.lightBlue[100]
                            ),
                          ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                Text(
                  'Don\'t have an account?',
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                  ),
                  ),

                FlatButton(
                  splashColor: Colors.white.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                  'Sign-UP',
                  style: TextStyle(color: Colors.lightBlue[100]),
                  ),
                )
              ],
            ),
          ),
      ),
        )),
    );
  }
}
