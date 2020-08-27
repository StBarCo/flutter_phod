import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class Canticles extends StatefulWidget {
  @override
  _CanticlesState createState() => _CanticlesState();
}

class _CanticlesState extends State<Canticles> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
      title: 'Canticles',
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