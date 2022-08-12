import 'package:flutter/material.dart';
import 'package:flutter_attendanceintern/constants.dart';

class ListLog extends StatefulWidget {
  final List<Widget> list = [];

  @override
  _ListLogState createState() => _ListLogState();
}

class _ListLogState extends State<ListLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Log',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(0.5),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            if (widget.list.length == 0) {
              return Container(

              );
            }
            return ListTile(
              title: widget.list[index] ?? '',
              contentPadding: EdgeInsets.only(top: 1.5, bottom: 1.5),
            );
          },
        ),
      ),
    );
  }
}