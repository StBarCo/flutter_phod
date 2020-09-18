import 'package:flutter/material.dart';

class Versical extends StatelessWidget {
  String speaker;
  String says;
  Versical({Key key, this.speaker = "", this.says = ""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            width: 80.0
          , alignment: Alignment.topLeft
          , child: Text(speaker)
        )
        , Flexible(
            child: Container(
                alignment: Alignment.topLeft
              , child: Column(
                  children: <Widget>[
                    Text( says )
                    , SizedBox(height: 8.0),
                  ]
              )
            )
        )
      ]
    //)Text("$speaker : $says"); //should be richtext
    );
  }

}
