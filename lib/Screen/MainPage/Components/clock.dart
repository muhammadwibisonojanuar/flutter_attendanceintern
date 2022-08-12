import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Clock extends StatefulWidget {
  @override
  _ClockState createState() => new _ClockState();
}

class _ClockState extends State<Clock> {
  var jam = '';
  var tanggal = '';
  void startJam() {
    Timer.periodic(new Duration(seconds: 1), (_) {
      var tgl = new DateTime.now();
      var formatedjam = new  DateFormat('hh:mm aaa').format(tgl);
      var formatedtanggal = new DateFormat('EEE, d MMM y').format(tgl);
      setState(() {
        jam = formatedjam;
        tanggal = formatedtanggal;
      });
    });
  }

  @override
  void initState() {
    startJam();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 10, top: 5),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              jam,
              style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 35.0,
              ),
            ),
            Text(
              tanggal,
              style: TextStyle(
                  fontFamily: 'avenir',
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}