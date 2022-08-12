import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendanceintern/Screen/Login/login.dart';
import 'package:flutter_attendanceintern/Screen/Signup/signup.dart';
import 'package:flutter_attendanceintern/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This size provide us total height and width of our screen
    return Container(
      child:Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Image.asset(
                  "assets/images/logo utk bg blue fix.png",
                  height: 200,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                    color: kPrimaryColor,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context){
                            return Login();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29.0)
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                    color: kPrimaryColor,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context){
                            return SignUp();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29.0)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}