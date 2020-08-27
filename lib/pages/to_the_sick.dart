import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class ToTheSick extends StatefulWidget {
  @override
  _ToTheSickState createState() => _ToTheSickState();
}

class _ToTheSickState extends State<ToTheSick> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Ministry to the Sick',
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