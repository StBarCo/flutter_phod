import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/gloria.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/line.dart';
import 'package:flutter_phod/helpers/lord_have_mercy.dart';
import 'package:flutter_phod/helpers/lords_prayer.dart';
import 'package:flutter_phod/helpers/paragraph.dart';
import 'package:flutter_phod/helpers/psalms_pick_one.dart';
import 'package:flutter_phod/helpers/reference.dart';
import 'package:flutter_phod/helpers/rubric.dart';
import 'package:flutter_phod/helpers/scripture_ref.dart';
import 'package:flutter_phod/helpers/section_title.dart';
import 'package:flutter_phod/helpers/versical.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/models/psalm_model.dart';

class Compline extends StatefulWidget {
  @override
  _ComplineState createState() => _ComplineState();
}

class _ComplineState extends State<Compline> {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Compline',
        body: DefaultTextStyle(
            style: TextStyle(fontSize: 18.0, color: Colors.black87),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              children: <Widget>[
                      PageHeader()
                    , Rubric("The Officiant begins")
                    , Paragraph("""
                          The Lord Almighty grant us a peaceful night
                          and a perfect end. Amen.
                      """)
                    , Versical(
                        speaker: "Officiant",
                        says: "Our help is in the Name of the Lord;")
                    , Versical(
                        speaker: "People", says: "The maker of heaven and earth.")
                    , Rubric("The Officiant continues")
                    , Text("Let us humbly confess our sins to Almighty God.")
                    , Rubric("Silence may be kept. The Officiant and People then say")
                    , Paragraph("""
                        Almighty God and Father, we confess to you,
                        to one another, and to the whole company of heaven,
                        that we have sinned, through our own fault,
                        in thought, and word, and deed,
                        and in what we have left undone.
                        For the sake of your Son our Lord Jesus Christ,
                        have mercy upon us, forgive us our sins,
                        and by the power of your Holy Spirit
                        raise us up to serve you in newness of life,
                        to the glory of your Name. Amen.
                        """)
                    , Rubric("The Officiant alone says")
                    , Paragraph("""
                        May Almighty God grant us forgiveness of all our sins,
                        and the grace and comfort of the Holy Spirit. Amen.
                        """)
                    , Versical(speaker: "Officiant",
                        says: "O God, make speed to save us;")
                    , Versical(
                        speaker: "People", says: "O Lord, make haste to help us.")
                    , Versical(speaker: "Officiant",
                        says: "Glory be to the Father, and to the Son, and to the Holy Spirit;")
                    , Versical(speaker: "People",
                        says: "As it was in the beginning, is now, and ever shall be, world without end. Amen.")
                    , Rubric("Except in Lent, add <strong>Alleluia.</strong>")
                    ,
                    Rubric("One or more of the following, or some other suitable Psalm, is sung or said.")
                    , SectionTitle(text: "Psalms")
                    , PsalmsPickOne(psalms:
                        [ Ps(4, 1, 999)
                          , Ps(31, 4, 6)
                          , Ps(91, 1, 999)
                          , Ps(134, 1, 999)
                        ])

                    , Rubric("At the end of the Psalms the Gloria Patri (Glory be...) is sung or said")
                    , Gloria()
                    , Rubric("One of the following, or some other suitable passage of Scripture, is read")
                    , ScriptureRef(
                        text: "You, O Lord, are in the midst of us, and we are called by your name; do not leave us."
                        , ref: "jeremiah 14:9"
                        )
                    , ScriptureRef(text: """
                        Come to me, all who labor and are heavy laden, and
                        I will give you rest. Take my yoke upon you, and learn
                        from me, for I am gentle and lowly in heart, and you will find
                        rest for your souls. For my yoke is easy, and my burden
                        is light.
                        """
                        , ref: "Matthew 11:28-30"
                        )
                    , ScriptureRef(text: """
                        Now may the God of peace who brought again from the dead
                        our Lord Jesus, the great shepherd of the sheep, by the blood
                        of the eternal covenant, equip you with everything good that
                        you may do his will, working in us that which is pleasing in
                        his sight, through Jesus Christ, to whom be glory forever and
                        ever. Amen.
                        """
                        , ref: "Hebrews 13:20-21"
                        )
                    , ScriptureRef(text: """
                        Be sober-minded; be watchful. Your adversary the devil prowls
                        around like a roaring lion, seeking someone to devour. Resist
                        him, firm in your faith.
                        """
                        , ref: "1 Peter 5:8-9"
                        )
                    , Rubric("At the end of the reading is said")
                    , Versical(says: "The Word of the Lord.")
                    , Versical(speaker: "People", says: "Thanks be to God.")
                    , Rubric("A period of silence may follow. A suitable hymn may be sung.")
                    , Versical(speaker: "Officiant",
                        says: "Into your hands, O Lord, I commend my spirit;")
                    , Versical(speaker: "People",
                        says: "For you have redeemed me, O Lord, O God of truth.")
                    , Versical(speaker: "Officiant",
                        says: "Keep me, O Lord, as the apple of your eye;")
                    , Versical(
                        speaker: "People",
                        says: "Hide me under the shadow of your wings.")
                    , LordHaveMercy()
                    , Rubric("Officiant and People")
                    , LordsPrayer()
                    , Versical(
                        speaker: "Officiant", says: "O Lord, hear our prayer;")
                    , Versical(
                        speaker: "People", says: "And let our cry come to you.")
                    , Versical(speaker: "Officiant", says: "Let us pray.")
                    , Rubric("The Officiant then says one or more of the following Collects. Other appropriate Collects may also be used.")
                    , Paragraph("""
                        Visit this place, O Lord, and drive far from it all snares of the
                        enemy; let your holy angels dwell with us to preserve us in
                        peace; and let your blessing be upon us always; through Jesus
                        Christ our Lord. Amen.
                        """)
                    , Paragraph("""
                        Lighten our darkness, we beseech you, O Lord; and by your
                        great mercy defend us from all perils and dangers of this night;
                        for the love of your only Son, our Savior Jesus Christ. Amen.
                        Be present, O merciful God, and protect us through the hours
                        of this night, so that we who are wearied by the changes and
                        chances of this life may rest in your eternal changelessness;
                        through Jesus Christ our Lord. Amen.
                        """)
                    , Paragraph("""
                        Look down, O Lord, from your heavenly throne, illumine this
                        night with your celestial brightness, and from the children of
                        light banish the deeds of darkness; through Jesus Christ our
                        Lord. Amen.
                        """)

                    , SectionTitle(text: "a collect for saturdays")
                    , Paragraph("""
                        We give you thanks, O God, for revealing your Son Jesus
                        Christ to us by the light of his resurrection: Grant that as we
                        sing your glory at the close of this day, our joy may abound in
                        the morning as we celebrate the Paschal mystery; through Jesus
                        Christ our Lord. Amen.
                        """)


                    , Rubric("One of the following prayers may be added")
                    , Paragraph("""
                      Keep watch, dear Lord, with those who work, or watch, or weep
                      this night, and give your angels charge over those who sleep.
                      Tend the sick, Lord Christ; give rest to the weary, bless the
                      dying, soothe the suffering, pity the afflicted, shield the joyous;
                      and all for your love’s sake. Amen.
                      """)
                    , Rubric("or this")
                    , Paragraph("""
                      O God, your unfailing providence sustains the world we live in
                      and the life we live: Watch over those, both night and day, who
                      work while others sleep, and grant that we may never forget that
                      our common life depends upon each other’s toil; through Jesus
                      Christ our Lord. <strong>Amen.</strong>
                      """)
                    , Rubric("Silence may be kept, and other intercessions and thanksgivings may be offered.")
                    , Rubric("The Officiant and People say or sing the Song of Simeon with this Antiphon")
                    , Paragraph("""
                      Guide us waking, O Lord, and guard us sleeping; that awake
                      we may watch with Christ, and asleep we may rest in peace.
                      """)
                    , Rubric("In Easter Season, add <em>Alleluia, alleluia, alleluia.</em>")
                    , SectionTitle(text: "nunc dimittis")
                    , SectionTitle(italic: true, text: "The Song of Simeon")
                    , Line(text: "Lord, now let your servant depart in peace, *")
                    , Line(indent: true, text: "according to your word.")
                    , Line(text: "For my eyes have seen your salvation, *")
                    , Line(indent: true,
                        text: "which you have prepared before the face of all people;")
                    , Line(text: "To be a light to lighten the Gentiles, *")
                    , Line(indent: true,
                        text: "and to be the glory of your people Israel.")
                    , Line(
                        text: "Glory be to the Father, and to the Son, and to the Holy Spirit; *")
                    , Line(indent: true,
                        text: "as it was in the beginning, is now, and ever shall be,")
                    , Line(indent: true, text: "world without end. Amen.")
                    , Reference("Luke 2:29-32")
                    , Paragraph("""
                      Guide us waking, O Lord, and guard us sleeping; that awake
                      we may watch with Christ, and asleep we may rest in peace.
                      """)
                    , Rubric("In Easter Season, add <em></Rubric>Alleluia, alleluia, alleluia.</em></Rubric>")
                    , Versical(speaker: "Officiant", says: "Let us bless the Lord.")
                    , Versical(speaker: "People", says: "Thanks be to God.")
                    , Rubric("The Officiant concludes with the following")
                    , Paragraph("""
                      The almighty and merciful Lord, Father, Son, and Holy Spirit,
                      bless us and keep us, this night and evermore. Amen.
                      """)
                    , SectionTitle(text: "Additional Directions")
                    , Paragraph("""
                      A Bishop or Priest, if present, may pronounce absolution after the
                      confession.
                      """)
                    , Paragraph("""
                      For those saying Compline every day, particularly in families or other
                      communities, additional short Scriptural readings may be desired. Some
                      appropriate readings include:
                      """)
                    , Line(indent: true, text: "isaiah 26:3-4")
                    , Line(indent: true, text: "isaiah 30:15")
                    , Line(indent: true, text: "matthew 6:31-34")
                    , Line(indent: true, text: "2 corinthians 4:6")
                    , Line(indent: true, text: "1 thessalonians 5:9-10")
                    , Line(indent: true, text: "1 thessalonians 5:23")
                    , Line(indent: true, text: "ephesians 4:26-27")
                    , Paragraph("""
                      Either version of the Lord’s Prayer may be ended with, “deliver us from
                      evil. Amen.” omitting the concluding doxology.
                      """)
                  ]
              ),
            )
        );
  }
}

