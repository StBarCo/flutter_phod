import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/reusablePieces/lords_prayer.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class ToTheSick extends StatefulWidget {
  @override
  _ToTheSickState createState() => _ToTheSickState();
}

class _ToTheSickState extends State<ToTheSick> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Ministry to the Sick',
      body: DefaultTextStyle(
          style: TextStyle(fontSize: 18.0, color: Colors.black87)
        , child: ListView(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
          , children: <Widget>[
                PageHeader(litDay: LitDay().init())
              , Rubric( text: "The Officiant begins")
              , Paragraph( text:"Savior of the world, by your Cross and precious blood you have redeemed us;")
              , Paragraph( text:"Save us, and help us, we humbly beseech you, O Lord.")
              , Rubric( text:  """
                  The Priest (or other authorized person) anoints the sick person’s 
                  forehead with the Oil of the Sick by making the sign of the Cross. 
                  If appropriate, other parts of the body which suffer from sickness 
                  or injury may also be anointed. Others may join in the laying 
                  on of hands. The Officiant says
                """)
              , Paragraph( text:"""
                  N., I anoint you with oil and I (or we) lay my (or our) hands 
                  upon you in the Name of the Father, and of the Son, and of the 
                  Holy Spirit. *Amen*.
                  """)
              , Paragraph( text:"""
                  Lord Jesus Christ, heal this your servant, sustain him with your 
                  presence, drive away all sickness of body, mind, and spirit, 
                  and give to him that victory of life and peace which will enable 
                  him to serve you both now and evermore. *Amen*.
                """)
              , Rubric( text: """
                  A Priest may add the following prayer. If this rite is used 
                  with multiple persons, it is appropriate for this prayer to be 
                  used after all have received individual prayer.
                """)
              , Paragraph( text:"""
                  As you are outwardly anointed with this holy oil, so may our 
                  heavenly Father grant you the inward anointing of the Holy Spirit. 
                  Of his great mercy, may he forgive you your sins, release you 
                  from suffering, and restore you to wholeness and strength. 
                  May he deliver you from all evil, preserve you in all goodness, 
                  and bring you to everlasting life; through Jesus Christ our 
                  Lord. *Amen*.
                """)
              , Rubric( text: """
                  Additional prayers or intercessions may be said. Additional prayers 
                  are on pages 231-235. See also Occasional Prayers #56-63 on 
                  pages 663-665.
                """)
              , Rubric( text: "The Lord’s Prayer is said.")
              , LordsPrayer()
              , Rubric( text: "The Officiant then prays")
              , Paragraph( text:"""
                  The Almighty Lord, who is a strong tower to all who put their 
                  trust in him, to whom all things in heaven, on earth, and under 
                  the earth bow and obey: Be now and evermore your defense, and 
                  make you know and feel that the only Name under heaven given 
                  for health and salvation is the Name of our Lord Jesus Christ. 
                  *Amen*.
                """)
              , Rubric( text: "A Priest may conclude the above prayer with a blessing.")
          ]
        )
      )
    );
  }
}
// TODO Implement this library.