import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/show_one_psalms.dart';
import 'package:flutter_phod/services/database.dart';
import 'package:flutter_phod/stores/psalm_map.dart';

class PsalmsPickOne extends StatefulWidget {
  List<Ps> psalms; // 
  PsalmsPickOne({Key key, this.psalms}) : super (key: key);
  @override
  _PsalmsPickOneState createState() => _PsalmsPickOneState();
}



class _PsalmsPickOneState extends State<PsalmsPickOne> {
  Future futurePsalm;

  @override
  void initState() {
    super.initState();
    futurePsalm = _getPsalm();
  }

  _getPsalm() async {
    return await DatabaseService().getPsalmByName(widget.psalms[0]);
  }

  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
        , children: <Widget>[
          ButtonBar(
          mainAxisSize: MainAxisSize.min
          , children: widget.psalms.map<Widget>((ps)
          { return RaisedButton(
                  onPressed: () {
                setState(() {
                    futurePsalm = DatabaseService().getPsalmByName(ps);
                  });
                }
              , child: Text("Psalm ${ps.ps}")
            );
          }).toList())
      , FutureBuilder(
          future: futurePsalm
          , builder: (context, snapshot) {
        return (snapshot.connectionState == ConnectionState.done)
            ? ShowOnePsalm(psalm: snapshot.data)
            : Container();
      }
      )
    ]
    );
  }
}
