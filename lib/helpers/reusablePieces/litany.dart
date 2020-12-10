import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';

class Litany extends StatelessWidget {
  Litany(this.call, this.response);
  final String call;
  final String response;
  @override
  Widget build(BuildContext context) {
    return PhrasedParagraph(content: [
        Line(text: call),
        Line(text: response, indent: 1, bold: true)
      ]
    );
  }
}
