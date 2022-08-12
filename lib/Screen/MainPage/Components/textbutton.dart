import 'package:flutter/material.dart';

class WordButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color textColor;
  const WordButton({
    Key key,
    this.text,
    this.press,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'Helvetica',
          ),
        ),
      ),
    );
  }
}