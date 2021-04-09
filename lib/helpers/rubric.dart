import 'package:flutter/material.dart';
import 'package:legereme/helpers/compress_white_space.dart';

class Rubric extends StatelessWidget {
  Rubric(this.text);
  final String text;
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Text(
            CompressWhiteSpace(text),
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.red[800],
            )

        )
    );
  }
}
