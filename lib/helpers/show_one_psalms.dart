import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/psalm_verses.dart';

class ShowOnePsalm extends StatelessWidget {
  final psalm;
  final showTitle;
  ShowOnePsalm({Key key, this.psalm, this.showTitle = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (psalm == null) ? Container() : Column(
        children: content(),
    );
  }

  List<Widget> content(){
    List<Widget> c = [];
    if(showTitle){
      c.add(SectionTitle(text:"${psalm.name}", ),);
    }
    c.addAll([ItemTitle(text: "${psalm.title}", leadingSpace: 0,),
    PsalmVerses(vss: psalm.vss)]);

    return c;
  }

}


