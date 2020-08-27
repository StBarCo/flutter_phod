import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextSpan Reference({String text = ''}) {
    return TextSpan(
        text: text,
            style: TextStyle(
              fontSize: 12.0,
              fontStyle: FontStyle.italic
            )
    );
}
