import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/compress_white_space.dart';
import 'package:flutter_phod/helpers/parts/reference.dart';
import '../parts.dart';

class ScriptureRef extends Line {
  String ref;

  ScriptureRef(
      {Key key,
        this.ref = '',
        String text = '',
        int indent = 0,
        bool bold = false,
        bool center = false,
        bool italic = false,
        double size })
      : super(
      key: key,
      text: text,
      indent: indent,
      bold: bold,
      center: center,
      italic: italic,
      size: size);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>
          [ Text(CompressWhiteSpace(text),
                  style: lineStyle().copyWith(color: Colors.black87),
            )
          , Text("$ref",
            style: Theme.of(context).textTheme.caption.merge(lineStyle()).apply(
            fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.right,)
          ]
      ),
    );
  }
}

