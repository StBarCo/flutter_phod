import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        context: context,
      title: 'Blog',
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