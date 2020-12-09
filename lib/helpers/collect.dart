import 'package:flutter/material.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/services/collect_db.dart';

class Collect extends StatefulWidget {
  final String ofType;
  final LitDay litDay;
  Collect({Key key, this.litDay, this.ofType}) : super(key: key);
  @override
  _CollectState createState() => _CollectState();
}

class _CollectState extends State<Collect> {
  Future futureCollect;
  @override

  void  initState() {
    super.initState();
    futureCollect = _getCollect();
  }

  _getCollect() async {
    return await CollectDB().getCollect(widget.litDay, widget.ofType);
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureCollect,
        builder: (context, snapshot) {
          switch( snapshot.connectionState) {
            case ConnectionState.none:
              return Text("Collect goes here");
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text("Waiting for Collect");
            case ConnectionState.done:
              return ShowCollect(collect: snapshot.data); // snapshot data
            default:
              return Text('COLLECT GOES HERE');
          }
        }
    );
  }
}

class ShowCollect extends StatelessWidget {
  final  collect;
  ShowCollect({Key key, this.collect}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (collect == null ) ? Container() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "${collect.get('title')}"
          , style: TextStyle( fontSize: 18.0 )
        ),
        Text(
            "${collect.get('text')}"
          , style: TextStyle( fontSize: 14.0 )
        )
      ]
    );
  }
}
