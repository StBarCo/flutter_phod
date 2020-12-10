import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/psalms.dart';
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
  int psalmIndex = 0;
  Future futurePsalm;

  @override
  void initState() {
    super.initState();
    futurePsalm = _getPsalm();
    psalmIndex = 0;
  }

  _getPsalm() async {
    return await DatabaseService().getPsalmByName(widget.psalms[0]);
  }

  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
        , children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        child: DropdownButton(
            value: psalmIndex,
            underline: Container(
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Theme.of(context).primaryColorDark),
            onChanged: (index) {
              setState(() {
                psalmIndex = index;
                futurePsalm = DatabaseService().getPsalmByName(widget.psalms[index]);
              });
            },
            items: widget.psalms.asMap().entries.map<DropdownMenuItem>((entry) {
              int i = entry.key;
              Ps ps = entry.value;

              return DropdownMenuItem(
                child: Text("Psalm ${ps.ps}"),
                value: i,
            );
            }).toList())
        ),
      FutureBuilder(
          future: futurePsalm
          , builder: (context, snapshot) {
        return (snapshot.connectionState == ConnectionState.done)
            ? ShowOnePsalm(psalm: snapshot.data, showTitle: false,)
            : Container();
      }
      )
    ]
    );
  }
}
