import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkingCondition extends StatefulWidget {
  @override
  _WorkingConditionState createState() => _WorkingConditionState();
}

class _WorkingConditionState extends State<WorkingCondition> {
  String dropdownValue;
  SharedPreferences prefs;
  final _key = 'cur_r';

  _read() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      dropdownValue = prefs.getString(_key) ?? "Normal"; // get the value
    });
  }
  @override
  void initState() {
    super.initState();
    _read(); // read in initState
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
          prefs.setString(_key, dropdownValue); // save value to SharedPreference
        },
        items: ['Normal', 'Lembur', 'Libur'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
