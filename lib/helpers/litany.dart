import 'package:flutter/material.dart';
import 'package:legereme/helpers/line.dart';

class Litany extends StatelessWidget {
  Litany(this.call, this.response);
  final String call;
  final String response;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Line(text: call),
        Line(text: response, indent: true, bold: true)
      ]
    );
  }
}
