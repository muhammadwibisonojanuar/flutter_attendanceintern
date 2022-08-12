import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendanceintern/Screen/MainPage/Components/textbutton.dart';
import 'package:flutter_attendanceintern/Screen/MainPage/Components/workingcondition.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:core';
import 'package:flutter_attendanceintern/Screen/MainPage/Components/clock.dart';
import 'package:flutter_attendanceintern/Screen/MainPage/Components/attendancelog.dart';
import 'package:flutter_attendanceintern/constants.dart';
import 'package:flutter_attendanceintern/Screen/MainPage/Components/date.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedClock = TimeOfDay.now();
  TimeOfDay picked_time;
  TimeOfDay picked_clock;
  final _timeIn = 'dateTimeLastClickedIN';
  final _timeOut = 'dateTimeLastClickedOUT';

  List<Widget> list = [];
  var jam = '';
  var clock = '';
  void startJam() {
    Timer.periodic(new Duration(seconds: 1), (_) {
      var tgl = new DateTime.now();
      var formatedjam = new  DateFormat('hh:mm aaa').format(tgl);
      var formatedclock = new DateFormat('hh:mm aaa').format(tgl);
      setState(() {
        jam = formatedjam;
        clock = formatedclock;
      });
    });
  }
  Future<Null> _selectedTime(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    picked_time = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        });

    if (picked_time != null && picked_time != selectedTime)
      setState(() {
        selectedTime = picked_time;
        String picked_timeInHourMin = picked_time.format(context);
        var setTimeInHourMin = prefs.setString(_timeIn, picked_timeInHourMin);
        print(setTimeInHourMin);
      });
    load_refTimeIn();
  }


  load_refTimeIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var time = await prefs.getString(_timeIn);
    if(time != null){
      setState(() {
        DateTime picked_time_Date_In = new DateFormat("hh:mm").parse(time);
        picked_time  = TimeOfDay.fromDateTime(picked_time_Date_In);
      });
    }
  }

  Future<Null> _selectedClock(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    picked_clock = await showTimePicker(
        context: context,
        initialTime: selectedClock,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        });

    if (picked_clock != null && picked_clock != selectedTime)
      setState(() {
        selectedClock = picked_clock;
        String picked_timeOutHourMin = picked_clock.format(context);
        var setTimeOutHourMin = prefs.setString(_timeOut, picked_timeOutHourMin);
        print(setTimeOutHourMin);
      });
    load_refTimeOut();
  }

  load_refTimeOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var time = await prefs.getString(_timeOut);
    setState(() {

      DateTime picked_time_Date_Out = new DateFormat("hh:mm").parse(time);
      picked_clock  = TimeOfDay.fromDateTime(picked_time_Date_Out);

    });
  }
  setInitTime() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
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
  void initState() {
    // TODO: implement initState
    super.initState();
    startJam();
    load_refTimeIn();
    load_refTimeOut();
    setInitTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live Attendance',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Clock(),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Schedule: ',
                                style: TextStyle(
                                    fontSize: 16.5
                                ),
                              ),
                              Date(),
                            ],
                          ),
                         WorkingCondition(),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                WordButton(
                                  text: selectedTime.format(context),
                                  press: () {_selectedTime(context);},
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
                                WordButton(
                                  text: selectedClock.format(context),
                                  press: () {_selectedClock(context);},
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
                                  color: Colors.blue,
                                  onPressed: (){
                                    setState(() {
                                      list.add(Text(
                                        '$jam           Clock In',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black
                                        ),
                                      ));
                                    });
                                  },
                                  child: Text(
                                    "Clock In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                ),
                                RaisedButton(
                                  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
                                  color: Colors.blue,
                                  onPressed: (){
                                    setState(() {
                                      list.add(
                                        Text('$clock           Clock Out',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  child: Text(
                                    "Clock Out",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: AttendanceLog(
                  list: list,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

