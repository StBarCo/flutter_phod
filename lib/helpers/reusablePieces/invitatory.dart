import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/services/canticles_db.dart';

import '../antiphon.dart';

class Invitatory extends StatefulWidget {
  final LitDay litDay;
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
    return PhrasedParagraph([
          SectionTitle(text: "Invitatory")
        , Rubric( text: "All stand.")
        , Versical( speaker: "Officiant", text: "O Lord, open our lips;")
        , Versical( speaker: "People", text: "And our mouth shall proclaim your praise.", bold: true)
        , Versical( speaker: "Officiant", text: "O God, make speed to save us;")
        , Versical( speaker: "People", text: "O Lord, make haste to help us.", bold: true)
        , Versical( speaker: "Officiant", text: "Glory be to the Father, and to the Son, and to the Holy Spirit;")
        , Versical( speaker: "People", text: "As it was in the beginning, is now, and ever shall be, world without end. Amen.", bold: true)
        , Versical( speaker: "Officiant", text: "Praise the Lord.")
        , Versical( speaker: "People", text: "The Lord’s Name be praised.", bold: true)
        , Rubric( text: "Then follows the Venite. Alternatively, the Jubilate may be used. One of these antiphons, or one from the seasonal antiphons provided at the end of the Office (pages 29-30), may be sung or said before and after the Invitatory Psalm.")
        , Antiphon(season: widget.litDay.season.id)
        , Container(
        alignment: Alignment.centerLeft,
          child: DropdownButton(
          value: invitatoryName ,
            underline: Container(
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColorDark),

            onChanged: (newValue) {
            setState( () {
              invitatoryName = newValue;
              futureInvitatory = CanticleDB().getCanticleByName(newValue);
             });
            },
          items: [
            DropdownMenuItem(
                  value: 'venite'
                  , child: Text('Venite')
              )
              , DropdownMenuItem(
                   value: 'venite_long'
                  , child: Text('Venite(L)')
              )
              , DropdownMenuItem(
              value: 'jubilate'

                  , child: Text('Jubilate')
              )
              , DropdownMenuItem(
              value: 'pascha_nostrum'
                  , child: Text('Pascha Nostrum')
              )
            ]
      ),
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
    return (inv == null)
      ? Text("Invitatory not available")
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start
        , children: <Widget>[
              // SectionTitle(text: inv.name)
             ItemTitle(text: inv.title, leadingSpace: 0,)
            , PhrasedParagraph([Text(inv.text)])
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
