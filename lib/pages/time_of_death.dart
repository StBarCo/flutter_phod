import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/canticle_show.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/reusablePieces/litany.dart';
import 'package:flutter_phod/helpers/reusablePieces/lords_prayer.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class TimeOfDeath extends StatefulWidget {
  @override
  _TimeOfDeathState createState() => _TimeOfDeathState();
}

class _TimeOfDeathState extends State<TimeOfDeath> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
      context: context,
        title: 'Ministry to the Dying',
      body: DefaultTextStyle(
          style: TextStyle(fontSize: 18.0, color: Colors.black87)
        , child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
            , children: <Widget>[
                  PageHeader(litDay: LitDay().init())
                , Rubric( text:  "The Officiant begins")
                , ScriptureRef(
                    text: "Peace be to this house [or place], and to all who dwell in it."
                  , ref: "luke 10:5t"
                  )
                , Paragraph( text: """
                    Almighty God, look on this your servant, lying in great weakness, 
                    and comfort /him/ with the promise of life everlasting, given 
                    in the resurrection of your Son Jesus Christ our Lord. Amen.
                  """)
                , Rubric( text: "The Officiant continues with the following prayer")
                , SectionTitle(text: "Litany At The Time Of Death")
                , Rubric( text:  """
                    The following may be said. When possible, it is desirable that 
                    those present join in the responses.
                  """)
                , Litany( "O God the Father,", "*Have mercy on your servant.*")
                , Litany( "O God the Son,", "*Have mercy on your servant.")
                , Litany( "O God the Holy Spirit,", "*Have mercy on your servant.*")
                , Litany( "O Holy Trinity, one God,", "*Have mercy on your servant.*")
                , Litany(
                      "Lord Jesus Christ, deliver your servant from all evil, sin, and tribulation;"
                    , "*Good Lord, deliver /him/.*")
                , Litany(
                      "By your holy Incarnation, by your Cross and Passion, by your precious Death and Burial,"
                    , "*Good Lord, deliver /him/.*")
                , Litany(
                      "By your glorious Resurrection and Ascension, and by the Coming of the Holy Spirit,"
                    , "*Good Lord, deliver /him/.*")
                , Litany(
                      "We sinners beseech you to hear us, Lord Christ: That it may please you to deliver the soul of your servant from the power of evil, and from eternal death,"
                    , "*We beseech you to hear us, good Lord.*")
                , Litany( "That it may please you mercifully to pardon all his sins,", "*We beseech you to hear us, good Lord.*")
                , Litany(
                      "That it may please you to give /him/ joy and gladness in your kingdom, with your saints in light,"
                    , "*We beseech you to hear us, good Lord.*")
                , Litany( "That it may please you to raise /him/ up at the last day,", "*We beseech you to hear us, good Lord.*")
                , Rubric( text: "The following or some other suitable anthem may be sung or said")
                , Litany( "Son of God, we beseech you to hear us.", "Son of God, we beseech you to hear us.")
                , Litany( "O Lamb of God, you take away the sin of the world;", "Have mercy upon /him/.")
                , Litany( "O Lamb of God, you take away the sin of the world;", "Have mercy upon /him/.")
                , Litany( "O Lamb of God, you take away the sin of the world;", "Grant /him/ your peace.")
                , Litany( "O Christ, hear us", "O Christ, hear us.")
                , Litany( "Lord, have mercy [upon us].", "*Christ, have mercy [upon us].*")
                , Litany( "Lord, have mercy [upon us].", "")
                , Rubric( text: "Officiant and People say together")
                , LordsPrayer()
                , Versical(speaker: "Officiant", text: "O Lord, show your mercy upon us;")
                , Versical(speaker: "People", text: "As we put our trust in you.")
                , Rubric( text: "The Officiant prays")
                , Versical(text: "Let us pray.")
                , Paragraph( text: """
                    O Sovereign Lord Christ, deliver your servant, N., from all evil, 
                    and set /him/ free from every bond; that he may rest with all 
                    your saints in the eternal habitations; where with the Father 
                    and the Holy Spirit you live and reign, one God, for ever and 
                    ever. *Amen*.
                  """)
                , Rubric( text:  """
                    The Officiant may invite those present to offer words of thanksgiving, 
                    reconciliation, or farewell. The Officiant may conclude with words of comfort.
                  """)
                , SectionTitle(text: "Commendation At The Time Of Death")
                , Rubric( text: "Here a Priest may anoint the dying person with oil.")
                , Rubric( text: "The Priest says")
                , Line(text: "Depart, O Christian soul, out of this world;", indent: 1)
                , Line(text: "In the Name of God the Father Almighty who created you;", indent: 1)
                , Line(text: "In the Name of Jesus Christ who redeemed you;", indent: 1)
                , Line(text: "In the Name of the Holy Spirit who sanctifies you.", indent: 1)
                , Line(text: "May your rest be this day in peace, and your dwelling place in the Paradise of God.", indent: 1)
                , SectionTitle(text: "A Commendatory Prayer")
                , Paragraph( text: """
                    Into your hands, O merciful Savior, we commend your servant N. 
                    Acknowledge, we humbly beseech you, a sheep of your own fold, 
                    a lamb of your own flock, a sinner of your own redeeming. 
                    Receive /him/ into the arms of your mercy, into the blessed 
                    rest of everlasting peace, and into the glorious company of 
                    the saints in light. *Amen*.
                  """)
                , Rubric( text: "The Officiant and People may say")
                , TodaysCanticle(named: 'nunc_dimittis')
                , SectionTitle(text: "Closing Prayer")
                , Rubric( text: "The Officiant prays")
                , Paragraph( text: """
                    May his soul and the souls of all the faithful departed, 
                    through the mercy of God, rest in peace. *Amen*.
                  """)
                , SectionTitle(text: "Additional Directions")
                , Paragraph( text: """
                    This rite is designed to be flexible in length. It may be 
                    adjusted according to the circumstances and condition of the 
                    dying person. Different portions of the rite may be used at 
                    different times, provided the order of the various elements 
                    is retained. In cases of great urgency, the Commendation at 
                    the Time of Death may be used alone. In the absence of a member 
                    of the clergy, this service may be led by any Christian.
                  """)
                , Paragraph( text: """
                    The minister may inquire of the dying person as to his or her 
                    desire to be reconciled to both God and neighbor. If the dying 
                    person feels troubled in conscience with any matter, the 
                    minister should offer the rite of Reconciliation of a Penitent. 
                    On evidence of repentance, the minister shall give assurance 
                    of God’s mercy and forgiveness.
                """)
                , Paragraph( text: """
                    If desired, Holy Communion may be administered using the rite 
                    for Communion of the Sick. It is appropriate for others present 
                    to receive the Sacrament as well. If the dying person cannot 
                    receive both the consecrated bread and wine, it is suitable 
                    to administer the Sacrament in one kind only. If he or she 
                    desires to receive, but by reason of extreme sickness is 
                    unable to consume either element, the minister is to assure 
                    the person that all the benefits of Holy Communion are 
                    conveyed, even though the elements are not received with the mouth.
                """)
              ],
        ),
      ),
    );
  }
}
