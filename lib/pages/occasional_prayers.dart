import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/paragraph.dart';
import 'package:flutter_phod/helpers/pop_up.dart';
import 'package:flutter_phod/services/occasional_prayers_db.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/helpers/page_drawer.dart';
import 'package:provider/provider.dart';

class OccasionalPrayers extends StatefulWidget {
  @override
  _OccasionalPrayersState createState() => _OccasionalPrayersState();
}

class _OccasionalPrayersState extends State<OccasionalPrayers> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<OccasionalPrayer>>.value(
          value: OccasionalPrayerDB().occasionalPrayerList
        , child: IphodScaffold(
            title: 'Occasional Prayers',
            body: DefaultTextStyle(
                style: TextStyle(fontSize: 18.0, color: Colors.black87)
              , child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
                  , children: <Widget>[
                      PageHeader(litDay: LitDay().init())
                    , ListOPs()
                    ],
              ),
            ),
          )
        );

  }
}

class ListOPs extends StatefulWidget {
  @override
  _ListOPsState createState() => _ListOPsState();
}

class _ListOPsState extends State<ListOPs> {
  List<OccasionalPrayer> prayersOfCategory;
  @override
  Widget build(BuildContext context) {
    final ops = Provider.of<List<OccasionalPrayer>>(context);
    final cats = (ops == null)
      ? null
      : ops.map((op) { return op.category;}).toSet().toList();
    return (cats == null)
      ? Container()
      : Stack(
        children: [
          Column
          ( children: cats.map<Widget>( (c)
            { return RaisedButton
                ( onPressed: ()
                  { List<OccasionalPrayer> temp = new List<OccasionalPrayer>.from(ops);
                    temp.retainWhere((element) => element.category == c );
                    setState(() => prayersOfCategory = new List<OccasionalPrayer>.from(temp) );
                  }
                , child: Text(c) );

            }).toList()
          )
        , PopUp( ShowThisCategory(prayersOfCategory), prayersOfCategory != null)
        ]
    );
  }
}

class ShowThisCategory extends StatefulWidget {
  ShowThisCategory(this.ops);
  final List<OccasionalPrayer> ops;
  @override
  _ShowThisCategoryState createState() => _ShowThisCategoryState();
}

class _ShowThisCategoryState extends State<ShowThisCategory> {
   OccasionalPrayer thisPrayer;
  @override
  Widget build(BuildContext context) {
    return ( widget.ops == null )
      ? Container()
      : Stack (
        children: [
            Column
              ( children: widget.ops.map<Widget>( (op)
                { return RaisedButton
                    ( onPressed: ()
                      { setState(() => thisPrayer = op ); }
                    , child: Text(op.title)
                    );
                }
                ).toList()
              )
            , PopUp(PrayerDetails(thisPrayer), thisPrayer != null)// ShowThisPrayer(thisPrayer)
            ]
          );
  }
}

class PrayerDetails extends StatelessWidget {
  PrayerDetails(this.prayer);
  final OccasionalPrayer prayer;
  @override
  Widget build(BuildContext context) {
    return (prayer == null)
      ? Container()
      : Column
      ( children: <Widget>
        [ Paragraph(prayer.title)
        , Paragraph(prayer.source)
        , Paragraph(prayer.prayer)
        ]
    );
  }
}



