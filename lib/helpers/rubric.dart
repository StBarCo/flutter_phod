import 'package:flutter/material.dart';

class Rubric extends StatelessWidget {
  String text;
  Rubric({Key key, this.text = ''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Text(
            text,
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.red[800],
            )

        )
    );
  }
}
