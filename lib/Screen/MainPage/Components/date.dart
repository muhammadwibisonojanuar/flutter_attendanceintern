import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  var date = '';
  void startDate(){
    Timer.periodic(Duration(seconds: 1), (_) {
      var dt = DateTime.now();
      var fd = DateFormat('d MMM y').format(dt);
      setState(() {
        date = fd;
      });
    });
  }
  @override
  void initState() {
    startDate();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        date,
        style: TextStyle(
            fontSize: 16.5
        ),
      ),
    );
  }
}