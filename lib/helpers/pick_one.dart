import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PickOne extends StatefulWidget {
  Map data;
  String label;
  PickOne({this.data, this.label});

  @override
  _PickOneState createState() => _PickOneState();
}

class _PickOneState extends State<PickOne> {
  final buttonPadding = const EdgeInsets.fromLTRB(0, 8, 0, 0);

  int itemSelected = 0;

  @override
  Widget build(BuildContext context) {
    List<String> itemLabels = widget.data.entries.map<String>((e) => e.value)
        .toList();
    List<String> itemKeys = widget.data.entries.map<String>((e) => e.key)
        .toList();
      return Column(
        children: <Widget>[
          Hero(
              tag: 'pickone'
              , child: Container(
                  child: Row(
                    children: <Widget>[
                      Text('Additional Prayers')
                      , Icon(Icons.toc)
                    ]
                )
              )
          )
          , Column( children: itemLabels.map<Widget>( (el) => Text(el) ) )
          ]
        );
    /*
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        [ Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: new TextField(
              decoration: new InputDecoration(
              ),
            )
        )
        ],

        Stack( children: <Widget>[Center(
          child: Card
            ( child: Column
                ( children: itemLabels.map<Widget>( (el) => Text(el)).toList() )
              , elevation: 99.0
          )
        )
        ])
      ],
    );

         */
  }
}