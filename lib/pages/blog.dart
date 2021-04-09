import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legereme/helpers/iphod_scaffold.dart';
import 'package:legereme/helpers/page_header.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
      title: 'Blog',
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PageHeader(),
              Text("Nothing to say yet")
            ]
        ),
      )
    );
  }
}
// TODO Implement this library.