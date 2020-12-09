import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../parts.dart';

class Reference extends StatelessWidget {
  Reference(this.text);
  final String text;
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 12.0
        , fontStyle: FontStyle.italic
      )
    );
  }
}
