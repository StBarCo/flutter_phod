import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/compress_white_space.dart';
import 'package:flutter_phod/helpers/reference.dart';

class ScriptureRef extends StatelessWidget {
  String text;
  String ref;
  ScriptureRef({Key key, this.text = '', this.ref = ''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>
        [ RichText(
              text: TextSpan(
                text: CompressWhiteSpace(text),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "  $ref",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontStyle: FontStyle.italic
                    )
                  ),
              ]
            )
          )
        , SizedBox(height: 12.0)
        ]
    );
  }
}

