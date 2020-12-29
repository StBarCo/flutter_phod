import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/line.dart';
import 'package:flutter_phod/helpers/lords_prayer.dart';
import 'package:flutter_phod/helpers/paragraph.dart';
import 'package:flutter_phod/helpers/psalms_pick_one.dart';
import 'package:flutter_phod/helpers/rubric.dart';
import 'package:flutter_phod/helpers/scripture_ref.dart';
import 'package:flutter_phod/helpers/section_title.dart';
import 'package:flutter_phod/helpers/versical.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/helpers/page_drawer.dart';
import 'package:flutter_phod/stores/psalm_map.dart';

class PrayerForVigil extends StatefulWidget {
  @override
  _PrayerForVigilState createState() => _PrayerForVigilState();
}

class _PrayerForVigilState extends State<PrayerForVigil> {
  ScrollController _scrollController = new ScrollController();
  bool todLitany = false;
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Prayers for a Vigil',
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
    child: ListView(
        controller: _scrollController
      , padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
      , children: <Widget>[
          PageHeader()
        , Rubric("It is appropriate that family and friends come together prior to a funeral. This rite may be used on such an occasion, whether at the church, a funeral home, or elsewhere.")
        , Rubric("The Minister says")

        , Paragraph( """
            Dear Friends: It was our Lord Jesus himself who said, “Come to
            me, all who labor and are heavy laden, and I will give you rest.”
            Let us pray, then, for our brother N., that he may rest from his
            labors, and enter into God’s eternal Sabbath rest.
            """)

        , SectionTitle(text: "Psalms")
        , Rubric("A psalm may be prayed. Psalms 23 and 121 are particularly appropriate.")
        , PsalmsPickOne( psalms:
            [ Ps(23, 1, 999)
            , Ps(121, 1, 999)
            ])

        , Rubric("One or more of the following Lessons is read.")

        , ScriptureRef( text: """
            But we do not want you to be uninformed, brothers and sisters,
            about those who are asleep, that you may not grieve as others
            do who have no hope. For since we believe that Jesus died and
            rose again, even so, through Jesus, God will bring with him
            those who have fallen asleep. For this we declare to you by a
            word from the Lord, that we who are alive, who are left until
            the coming of the Lord, will not precede those who have fallen
            asleep.
            """, ref: "1 thessalonians 4:13-15")

         , ScriptureRef( text: """
             In my Father’s house are many rooms. If it were not so, would
             I have told you that I go to prepare a place for you?And if I go
             and prepare a place for you, I will come again and will take you
             to myself, that where I am you may be also.
             """, ref: "john 14:2-3")

         , Rubric("The following and other additional prayers may be said. The Litany at the Time of Death (pages 237-239) may also be used.")
         , RaisedButton(
               child: Text('Litany at the Time of Death')
             , onPressed: () { setState(() => todLitany = !todLitany); }
           )
         , todLitany ? _LitanyAtDeath() : Container()
         , Paragraph( """
              O God, who by the glorious resurrection of your Son Jesus
              Christ destroyed death and brought life and immortality to
              light: Grant that your servant N., being raised with Christ, may
              know the strength of his presence and rejoice in his eternal
              glory; who with you and the Holy Spirit lives and reigns, one
              God, for ever and ever. Amen.
              """)
          , Paragraph( """
                Most merciful God, whose wisdom is beyond our
                understanding: deal graciously with those who mourn
                [especially _________]. Surround them with your love, that they
                may not be overwhelmed by their loss, but have confidence in
                your goodness, and strength to meet the days to come; through
                Jesus Christ our Lord. Amen.
                """)
          , Rubric("The Minister says")
          , Versical(says: "And now as our Savior Christ has taught us, we are bold to pray")
          , Rubric("Minister and People say together")
          , LordsPrayer()
          , Rubric("The Minister says")
          , ScriptureRef( text: """
              May the God of hope fill us with all joy and peace in believing
              through the power of the Holy Spirit. Amen.
              """, ref: "romans 15:13")
          , Rubric("The Minister may say")
          , Paragraph( """
              May his soul, and the souls of all the faithful departed,
              through the mercy of God, rest in peace.
              """)
          , Versical( speaker: "People", says: "And may light perpetual shine upon them. Amen.")

          ],
        ),
      )
    );
  }
}
// TODO Implement this library.

class _LitanyAtDeath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Line(text: "O God the Father,")
        , Line(text: "Have mercy on your servant.", indent: true, bold: true)
        , Line(text: "O God the Son,")
        , Line(text: "Have mercy on your servant.", indent: true, bold: true)
        , Line(text: "O God the Holy Spirit,")
        , Line(text: "Have mercy on your servant.", indent: true, bold: true)
        , Line(text: "O Holy Trinity, one God,")
        , Line(text: "Have mercy on your servant.", indent: true, bold: true)
        , Line(text: "Lord Jesus Christ, deliver your servant from all evil, sin, and tribulation;")
        , Line(text: "Good Lord, deliver /him/.", indent: true, bold: true)
        , Line(text: "By your holy Incarnation, by your Cross and Passion, by your precious Death and Burial,")
        , Line(text: "Good Lord, deliver /him/.", indent: true, bold: true)
        , Line(text: "By your glorious Resurrection and Ascension, and by the Coming of the Holy Spirit,")
        , Line(text: "Good Lord, deliver /him/.", indent: true, bold: true)
        , Line(text: "We sinners beseech you to hear us, Lord Christ: That it may please you to deliver the soul of your servant from the power of evil, and from eternal death,")
        , Line(text: "We beseech you to hear us, good Lord.", indent: true, bold: true)
        , Line(text: "That it may please you mercifully to pardon all his sins,")
        , Line(text: "We beseech you to hear us, good Lord.", indent: true, bold: true)
        , Line(text: "That it may please you to give /him/ joy and gladness in your kingdom, with your saints in light,")
        , Line(text: "We beseech you to hear us, good Lord.", indent: true, bold: true)
        , Line(text: "That it may please you to raise /him/ up at the last day,")
        , Line(text: "We beseech you to hear us, good Lord.", indent: true, bold: true)

      ],
    );
  }
}
