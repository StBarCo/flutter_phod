import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_phod/stores/litday.dart';

class PageHeader extends StatelessWidget {
  LitDay litDay;
  PageHeader({Key key, this.litDay}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
            DateFormat.MMMMEEEEd().format(litDay.now),
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 2
          )
        ),
        Text(
            litDay.season.title,
            style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2
            )

        ),
      ],
    );
  }
}
