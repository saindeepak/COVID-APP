import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covid/services/usermanagement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utilities.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email;
  var password1;
  var password2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height:100.0),
                Center(
                  child: Text(
                    'SignUp',
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
                            password1 = val;
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

                SizedBox(height: 10.0),
                //pass again
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Re-Enter Password',
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
                            password2 = val;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          hintText: 'Password Again',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30.0,
                ),
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
                      if((password1==password2) && password1 != null && email != null){
                      FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password1)
                        .then((signedInUser) {
                      UserManagement().storeNewUser(signedInUser, context);
                    }).catchError((e) {
                      print(e);
                    });
                    Navigator.of(context).pushNamed('/login');
                    }
                  },
                  child:  Center(
                      child: Text(
                        'SIGN-UP',
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

                // GestureDetector(
                //   onTap: () {
                //   },
                //   child: Container(
                //     height: 45.0,
                //     width: 250.0,
                //     decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(30.0),
                //       boxShadow: [ BoxShadow(
                //         color: Colors.black38,
                //         blurRadius: 6.0,
                //         offset: Offset(0,2),
                //         spreadRadius: 2.0,
                //         ),
                //       ],
                //     ),
                //     child: Center(
                //       child: Text(
                //         'SIGN-UP',
                //         style: TextStyle(
                //           fontFamily: 'OpenSans',
                //           fontWeight: FontWeight.bold,
                //           fontSize: 15.0,
                //           color: Colors.lightBlue[100]
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
      ),
        )),
    );
  }
}

