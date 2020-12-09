import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phod/stores/psalm_map.dart';
import 'package:intl/intl.dart';

class PsalmVerses extends StatelessWidget {
  List<PsalmVs> vss;
  PsalmVerses({Key key, this.vss}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left:10,),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: vss.map<Widget>( (v) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FirstLine( vsNumber: v.vsNumber, text: v.first ),
                  SecondLine( text: v.second ),
                ]
            );
          }).toList()
      ),
    );
  }
}

class FirstLine extends StatelessWidget {
  String vsNumber;
  String text;

  FirstLine({Key key, this.vsNumber, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: 20.0
              // , alignment: Alignment.topLeft
              , child: Text(
                    vsNumber
                  , style: TextStyle(fontSize: (vsNumber.length > 2) ? 8.0 : 8.0, color: Colors.black54)

          )
          )
          , Flexible(
              child: Container(
                  // alignment: Alignment.topLeft,
                  child: Text( text )
              )
          )
        ]
      //)Text("$speaker : $says"); //should be richtext
    );
  }
}

class SecondLine extends StatelessWidget {
  String text;
  SecondLine({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: 40.0
              // , alignment: Alignment.topLeft
              , child: Container()
          )
          , Flexible(
              child: Container(
                  // alignment: Alignment.topLeft
                   child: Column(
                      children: <Widget>[
                          Text( text )
                        , SizedBox(height: 8.0)
                      ]
                  )
              )
          )
        ]
      //)Text("$speaker : $says"); //should be richtext
    );
  }
}


/*
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            width: 80.0
          , alignment: Alignment.topLeft
          , child: Text(speaker)
        )
        , Flexible(
            child: Container(
                alignment: Alignment.topLeft
              , child: Column(
                  children: <Widget>[
                    Text( says )
                    , SizedBox(height: 8.0),
                  ]
              )
            )
        )
      ]
    //)Text("$speaker : $says"); //should be richtext
    );

 */