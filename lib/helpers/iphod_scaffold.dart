import 'package:flutter/material.dart';
import 'package:legereme/helpers/iphod_app_bar.dart';
import 'package:legereme/helpers/page_drawer.dart';

Scaffold IphodScaffold(
    { String title
      , Widget body
      , Color backgroundColor
    }) {
  return Scaffold(
        appBar: IphodAppBar(title: title)
      , backgroundColor: backgroundColor
      , drawer: PageDrawer()
      , body: body
  );
}

