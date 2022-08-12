import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendanceintern/constants.dart';
import 'package:flutter_attendanceintern/Screen/MainPage/mainpage.dart';
import 'package:flutter_attendanceintern/transition.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 125.0),
                child: Image.asset(
                  "assets/images/logo utk bg white fix.png",
                  height: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.69, left: 55.0, right: 55.0),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(29.0),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                          Icons.mail,
                          color: kPrimaryColor
                      ),
                      contentPadding: EdgeInsets.all(3.0),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.69, left:55.0, right: 55.0, bottom: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(29.0),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.vpn_key_rounded,
                        color: kPrimaryColor,
                      ),
                      contentPadding: EdgeInsets.all(3.0),
                      hintText: 'Enter your Password',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        SlideLeftRoute(widget: MainPage())
                    );
                  },
                  elevation: 2.0,
                  fillColor: Colors.indigoAccent[100],
                  child: Icon(
                    Icons.arrow_forward,
                    size: 36.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(20.0),
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}