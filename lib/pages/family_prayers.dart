import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/helpers/page_drawer.dart';

class FamilyPrayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Family Prayers',
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