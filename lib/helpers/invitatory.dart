import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/rubric.dart';
import 'package:flutter_phod/helpers/section_title.dart';
import 'package:flutter_phod/helpers/versical.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/services/cantiles_db.dart';

import 'antiphon.dart';

class Invitatory extends StatefulWidget {
  LitDay litDay;
  Invitatory({Key key, this.litDay}) : super(key: key);

  @override
  _InvitatoryState createState() => _InvitatoryState();
}

class _InvitatoryState extends State<Invitatory> {
  Future futureInvitatory;
  String invitatoryName;

  @override
  void initState() {
    super.initState();
    futureInvitatory = _getInvitatory();
  }

  _getInvitatory() async {
    setState(() {
      invitatoryName ??= _getCollect(widget.litDay);
    });
    return await CanticleDB().getCanticleByName( invitatoryName );
  }
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          SectionTitle(text: "Invitatory")
        , Rubric("All stand.")
        , Versical( speaker: "Officiant", says: "O Lord, open our lips;")
        , Versical( speaker: "People", says: "And our mouth shall proclaim your praise.")
        , Versical( speaker: "Officiant", says: "O God, make speed to save us;")
        , Versical( speaker: "People", says: "O Lord, make haste to help us.")
        , Versical( speaker: "Officiant", says: "Glory be to the Father, and to the Son, and to the Holy Spirit;")
        , Versical( speaker: "People", says: "As it was in the beginning, is now, and ever shall be, world without end. Amen.")
        , Versical( speaker: "Officiant", says: "Praise the Lord.")
        , Versical( speaker: "People", says: "The Lord’s Name be praised.")
        , Rubric("Then follows the Venite. Alternatively, the Jubilate may be used. One of these antiphons, or one from the seasonal antiphons provided at the end of the Office (pages 29-30), may be sung or said before and after the Invitatory Psalm.")
        , Antiphon(season: widget.litDay.season.id)
        , ButtonBar(
              mainAxisSize: MainAxisSize.min
            , children: <Widget>[
                  RaisedButton(
                      onPressed: () { setState( () {
                        futureInvitatory = CanticleDB().getCanticleByName( 'venite' );
                      }  ); }
                    , child: Text('Venite')
                  )
                  , RaisedButton(
                      onPressed: () { setState( () {
                        futureInvitatory = CanticleDB().getCanticleByName( 'venite_long');
                      }  ); }
                    , child: Text('Venite(L)')
                  )
                  , RaisedButton(
                      onPressed: () { setState( () {
                        futureInvitatory = CanticleDB().getCanticleByName( 'jubilate');
                      }  ); }
                    , child: Text('Jubilate')
                  )
                  , RaisedButton(
                      onPressed: () { setState( () {
                        futureInvitatory = CanticleDB().getCanticleByName( 'pascha_nostrum');
                      }  ); }
                    , child: Text('Pascha Nostrum')
                  )
                ]
          )
        , FutureBuilder(
              future: futureInvitatory
            , builder: (context, snapshot) {
                switch( snapshot.connectionState) {
                  case ConnectionState.done:
                    return ShowInvitatory(inv: snapshot.data); // snapshot data

                  default:
                  return Container();
                }
            }
        )
        // <Antiphon />
        ]
    );
  }
}

class ShowInvitatory extends StatelessWidget {
  var inv;
  ShowInvitatory({Key key, this.inv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("INVITATORY: ${inv.data().keys}");
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start
        , children: <Widget>[
              Text(inv.get('name'))
            , Text(inv.get('title'))
            , SizedBox(height: 16.0)
            , Text(inv.get('text'))
    ]);
  }

}


String _getCollect(LitDay litDay) {
  String invitatory;

  if (litDay.service == "ep") {
    return "phos_hilaron";
  }
  invitatory = (litDay.doy % 2) == 1 ? "venite" : "jubilate";

  // during Eastertide, Pascha Nostrum only
  if (litDay.season == 'easter') {
    return "pascha_nostrum";
  }

  //  on the 19th of the month (paslm 95 day), do not use venite
  if (litDay.now.day == 19) {
    return "jubilate";
  }

  //  during Lent, Venite (long version) only
  if (litDay.season == "ashWednesday" || litDay.season == "lent") {
    //  Sundays in lent: jubilate
    invitatory = litDay.now.weekday == 7 ? "jubilate" : "venite_long";
  }
  return invitatory;
}
