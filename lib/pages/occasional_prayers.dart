import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/helpers/page_drawer.dart';

class OccasionalPrayers extends StatefulWidget {
  @override
  _OccasionalPrayersState createState() => _OccasionalPrayersState();
}

class _OccasionalPrayersState extends State<OccasionalPrayers> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Occasional Prayers',
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