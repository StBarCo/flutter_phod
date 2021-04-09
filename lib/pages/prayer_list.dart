import 'package:flutter/material.dart';
import 'package:legereme/helpers/iphod_scaffold.dart';
import 'package:legereme/helpers/page_header.dart';

class PrayerList extends StatefulWidget {
  @override
  _PrayerListState createState() => _PrayerListState();
}

class _PrayerListState extends State<PrayerList> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Prayer List',
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PageHeader(),
            Text("Not ready yet")
          ],
        ),
      ),
    );

  }
}
// TODO Implement this library.