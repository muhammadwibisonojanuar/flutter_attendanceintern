import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendanceintern/Screen/MainPage/Components/viewlog.dart';
import 'package:flutter_attendanceintern/Screen/MainPage/Components/listview.dart';
import 'package:flutter_attendanceintern/transition.dart';


class AttendanceLog extends StatefulWidget {
  final List<Widget> list;

  AttendanceLog({this.list});

  @override
  _AttendanceLogState createState() => _AttendanceLogState();
}

class _AttendanceLogState extends State<AttendanceLog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Attendance Log',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Helvetica',
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 90),
                    child: FlatButton(
                      textColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            TransitionPageRoute(widget: ListLog())
                        );
                      },
                      child: Text(
                        'View Log',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListLog2(list: widget.list),
            ],
          ),
        ),
      ),
    );
  }
}