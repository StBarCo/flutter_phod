import 'package:flutter/material.dart';
import 'package:legereme/controllers/canticleController.dart';
import 'package:legereme/models/canticle.dart';
import 'package:get/get.dart';
import 'package:legereme/helpers/rubric.dart';
import 'package:legereme/helpers/section_title.dart';
import 'package:legereme/helpers/versical.dart';
import 'package:legereme/models/liturgical_day.dart';

import 'antiphon.dart';

CanticleController c = Get.put( CanticleController());

class Invitatory extends StatelessWidget {
  LiturgicalDay litDay;
  Invitatory({Key key, this.litDay}) : super(key: key);
  @override
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
        , Antiphon(season: litDay.season.id)
        , ButtonBar(
              mainAxisSize: MainAxisSize.min
            , children: <Widget>[
                  RaisedButton(
                      onPressed: () => c.setInvitatory('venite')
                    , child: Text('Venite')
                  )
                  , RaisedButton(
                      onPressed: () => c.setInvitatory('venite_long')
                    , child: Text('Venite(L)')
                  )
                  , RaisedButton(
                      onPressed: () => c.setInvitatory('jubilate')
                    , child: Text('Jubilate')
                  )
                  , RaisedButton(
                      onPressed: () => c.setInvitatory('pascha_nostrum')
                    , child: Text('Pascha Nostrum')
                  )
                ]
          )
        , Obx( () => ShowInvitatory(inv: c.invitatory))
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
    return (inv == null || inv == CanticleModel())
      ? Text("Invitatory not available")
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start
        , children: <Widget>[
              if(inv.name != null) Text(inv.name)
            , if(inv.title != null) Text(inv.title)
            , SizedBox(height: 16.0)
            , if(inv.text != null) Text(inv.text)
    ]);
  }

}
