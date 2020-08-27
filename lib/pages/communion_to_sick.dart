import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class CommunionToSick extends StatefulWidget {
  @override
  _CommunionToSickState createState() => _CommunionToSickState();
}

class _CommunionToSickState extends State<CommunionToSick> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
      title: 'Communion to the Sick',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PageHeader(litDay: LitDay().init()),
        ],
      )
    );

  }
}
// TODO Implement this library.