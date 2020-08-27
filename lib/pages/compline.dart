import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class Compline extends StatefulWidget {
  @override
  _ComplineState createState() => _ComplineState();
}

class _ComplineState extends State<Compline> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Compline',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PageHeader(litDay: LitDay().init()),
        ],
      )
    );

  }
}
