import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/reference.dart';

class Scripture extends StatelessWidget {
  String text;
  String ref;
  Scripture({Key key, this.text = '', this.ref = ''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: RichText(
          text: TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 18.0,
            ),
            children: [
              Reference(text: ref),
            ]
          )
        )
    );
  }
}
