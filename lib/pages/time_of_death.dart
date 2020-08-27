import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class TimeOfDeath extends StatefulWidget {
  @override
  _TimeOfDeathState createState() => _TimeOfDeathState();
}

class _TimeOfDeathState extends State<TimeOfDeath> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Ministry to the Dying',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PageHeader(litDay: LitDay().init()),
        ],
      ),
    );

  }
}
// TODO Implement this library.