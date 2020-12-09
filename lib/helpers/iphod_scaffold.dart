import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_app_bar.dart';
import 'package:flutter_phod/helpers/page_drawer.dart';

Scaffold IphodScaffold(
    { String title
      , Widget body
      , Color backgroundColor
      , BuildContext context
    }) {
  return Scaffold(
        appBar: IphodAppBar(title: title, context: context)
      // , backgroundColor: backgroundColor
      , drawer: PageDrawer()
      , body: body
  );
}

