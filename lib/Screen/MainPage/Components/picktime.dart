import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:core';

class PickTime extends StatefulWidget {

  @override
  _PickTimeState createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
  TimeOfDay selectedTime; // for the initial
  TimeOfDay selectedClock; // for the initial
  TimeOfDay picked_time; //for showtimepicker
  TimeOfDay picked_clock; //for showtimepicker
  SharedPreferences prefs;
  final _timeIn = 'dateTimeLastClickedIN';
  final _timeOut = 'dateTimeLastClickedOUT';


  Future<void> _selectedTime(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    picked_time = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });
    if (picked_time != null && picked_time != selectedTime)
      setState(() {
        selectedTime = picked_time;
        String picked_timeInHourMin = selectedTime.toString();
        var setTimeInHourMin = prefs.setString(_timeIn, picked_timeInHourMin);
        print(setTimeInHourMin);
      });
    load_refTime();
  }

  load_refTime() async {
    prefs = await SharedPreferences.getInstance();
    var time = await prefs.getString(_timeIn);
    if(time != null){
      setState(() {
        DateTime picked_time_Date = new DateFormat("hh:mm aaa").parse(time);
        picked_time  = TimeOfDay.fromDateTime(picked_time_Date);
      });
    }
  }

  Future<void> _selectedClock(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    picked_clock = await showTimePicker(
        context: context,
        initialTime: selectedClock,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_clock != null && picked_clock != selectedClock)
      setState(() {
        selectedClock = picked_clock;
        String picked_timeInHourMin = selectedClock.toString();
        var setTimeInHourMin = prefs.setString(_timeOut, picked_timeInHourMin);
        print(setTimeInHourMin);
      });
    load_refClock();
  }

  load_refClock() async {
    prefs = await SharedPreferences.getInstance();
    var time = await prefs.getString(_timeOut);
    setState(() {
      DateTime picked_time_Date = new DateFormat("hh:mm aaa").parse(time);
      picked_clock  = TimeOfDay.fromDateTime(picked_time_Date);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setInitTime();
  }

  setInitTime() async{
    prefs = await SharedPreferences.getInstance();
    var timeIn = await prefs.getString(_timeIn);
    var timeOut = await prefs.getString(_timeOut);


    if(timeIn != null){
      DateTime picked_time_DateIn = new DateFormat("hh:mm aaa").parse(timeIn);
      setState(() {
        selectedTime  = TimeOfDay.fromDateTime(picked_time_DateIn);
      });
    }
    if(timeOut != null){
      DateTime picked_time_DateOut = new DateFormat("hh:mm aaa").parse(timeOut);
      setState(() {
        selectedClock = TimeOfDay.fromDateTime(picked_time_DateOut);
      });
    }
    else{
      setState(() {
        selectedTime  = TimeOfDay.now();
        selectedClock = TimeOfDay.now();
      });
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                _selectedTime(context); // 1
              },
              child: Text(
                selectedTime.format(context),
                style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
            Text(
              '-',
              style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
              ),
            ),
            FlatButton(
              onPressed: () {
                _selectedClock(context); //2
              },
              child: Text(
                selectedClock.format(context),
                style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
