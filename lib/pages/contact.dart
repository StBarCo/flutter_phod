import 'package:flutter/material.dart';
import 'package:legereme/helpers/iphod_scaffold.dart';
import 'package:legereme/helpers/page_header.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Contact',
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PageHeader(),
            Text("Haven't figured this out yet")
          ],
        ),
      )
    );

  }
}
// TODO Implement this library.