import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_app_bar.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        context: context,
      title: 'About',
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