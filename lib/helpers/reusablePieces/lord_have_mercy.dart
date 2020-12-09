import 'package:flutter/material.dart';

class LordHaveMercy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 14.0)
        , Text("Lord, have mercy [upon us].")
        , Text("Christ, have mercy [upon us].")
        , Text("Lord, have mercy [upon us].")
          , SizedBox(height: 14.0)
        ],
      ),
    );
  }
}
