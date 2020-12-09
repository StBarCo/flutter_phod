import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/reusablePieces/apostles_creed.dart';
import 'package:flutter_phod/helpers/reusablePieces/gloria.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/reusablePieces/lords_prayer.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/parts/reference.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/parts/scripture_ref.dart';

import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/helpers/page_drawer.dart';

class FamilyPrayers extends StatefulWidget {
  @override
  _FamilyPrayersState createState() => _FamilyPrayersState();
}

class _FamilyPrayersState extends State<FamilyPrayers> {
  bool additionalPrayers = false;
  List<String> sections = ['Morning', 'Midday', 'Evening', 'End of Day'];
  Widget thisSectionWidget = Container();
  List<Widget> sectionWidgets = [ _Morning(), _Midday(), _Evening(), _Night() ];
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
      title: 'Family Prayers',
      body: DefaultTextStyle(
          style: TextStyle(fontSize: 18.0, color: Colors.black87),
          child: ListView(
          children: <Widget>[
            PageHeader(litDay: LitDay().init()),
            ButtonBar(
                buttonMinWidth: 80.0
              , mainAxisSize: MainAxisSize.min
              , alignment: MainAxisAlignment.center
              , children: sections.asMap().entries.map<Widget>((entry) {
                  int idx = entry.key;
                  String val = entry.value;
                  return RaisedButton(
                      onPressed: () {
                        setState(() => thisSectionWidget = sectionWidgets[idx] );
                      }
                      , child: Text(val)
                    );
                  }
              ).toList()
            ),
            thisSectionWidget,
            RaisedButton(
                  onPressed: () { setState( () => additionalPrayers = !additionalPrayers ); }
              ,   child: Text('Additional Prayers')
            ),
            additionalPrayers ? _AdditionalPrayers() : Container()
          ],
        ),
      )
    );
  }
}
// TODO Implement this library.

class _Morning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
          SectionTitle(text: "For the Morning")
        , Rubric( text:  "The following or some other verse of Scripture is said")
        , Line( text: "O Lord, open my lips,")
        , Line( indent: 1,  text: "and my mouth shall show forth your praise.")
        , Reference("Psalm 51:15")

        , SectionTitle( text: "Psalm 51:10-12")
        , Line( text: "10 Create in me a clean heart, O God, *")
        , Line( indent: 1,  text: "and renew a right spirit within me.")
        , Line( text: "11 Cast me not away from your presence, *")
        , Line( indent: 1,  text: "and take not your holy Spirit from me.")
        , Line( text: "12 O give me the comfort of your help again, *")
        , Line( indent: 1,  text: "and sustain me with your willing Spirit.")
        , Gloria()
        , Rubric( text:  "Alternatively, Psalm 5:1-3 may be used.")
        , SectionTitle( text: "a reading from holy scripture")
        , ScriptureRef( text: """
            Blessed be the God and Father of our Lord Jesus Christ!
            According to his great mercy, he has caused us to be born again
            to a living hope through the resurrection of Jesus Christ from
            the dead.
            """, ref: "1 Peter 1:3")
        , Rubric( text:  "or this")
        , ScriptureRef( text: """
            Give thanks to the Father, who has qualified you to share in
            the inheritance of the saints in light. He has delivered us from
            the domain of darkness and transferred us to the kingdom of
            his beloved Son, in whom we have redemption, the forgiveness
            of sins.
            """, ref: "Colossians 1:12-14")
        , Rubric( text:  "or this")
        , ScriptureRef( text: """
            If then you have been raised with Christ, seek the things that
            are above, where Christ is, seated at the right hand of God. Set
            your minds on things that are above, not on things that are on
            earth. For you have died, and your life is hidden with Christ in
            God. When Christ who is your life appears, then you also will
            appear with him in glory.
            """, ref: "Colossians 3:1-4")
         , Rubric( text:  "A period of silence may follow.")
         , Rubric( text:  "A hymn or canticle may be used; the Apostles’ Creed (page 75) may be said. Prayers may be offered for ourselves and others.")
         , LordsPrayer()
         , SectionTitle( text: "The Collect")
         , Paragraph( text:"""
            O Lord, our heavenly Father, almighty and everlasting God, you
            have brought us safely to the beginning of this day: Defend us
            by your mighty power, that we may not fall into sin nor run into
            any danger; and that, guided by your Spirit, we may do what is
            righteous in your sight; through Jesus Christ our Lord. Amen.
            """)
      ],
    );
  }
}

class _Midday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
            SectionTitle(text: "At Midday")
          , Rubric( text:  "The following or some other verse of Scripture is said")
          , ScriptureRef(text: """
              Blessed be the God and Father of our Lord Jesus Christ, who
              has blessed us in Christ with every spiritual blessing in the
              heavenly places.
              """, ref: "Ephesians 1:3")
          , SectionTitle( text: "psalm 113:1-4")
          , SectionTitle( italic: true, text: "Laudate, pueri")
          , Line( text: "1 Praise the Lord. Sing praises, you servants of the Lord; *")
          , Line( indent: 1,  text: "O praise the Name of the Lord. 2 Blessed be the Name of the Lord, *")
          , Line( indent: 1,  text: "from this time forth for evermore.")
          , Line( text: "3 The Lord’s Name be praised *")
          , Line( indent: 1,  text: "from the rising up of the sun to the going down of the same.")
          , Line( text: "4 The Lord is high above all nations, *")
          , Line( indent: 1,  text: "and his glory above the heavens.")
          , Gloria()
          , Rubric( text:  "a reading from holy scripture")
          , ScriptureRef(text: """
              Abide in me, and I in you. As the branch cannot bear fruit by
              itself, unless it abides in the vine, neither can you, unless you
              abide in me. I am the vine; you are the branches. Whoever
              abides in me and I in him, he it is that bears much fruit, for
              apart from me you can do nothing.
              """, ref: "John 15:4-5")

          , Rubric( text:  "or this")
          , ScriptureRef(text: """
              Do not be anxious about anything, but in everything by prayer
              and supplication with thanksgiving let your requests be made
              known to God. And the peace of God, which surpasses all
              understanding, will guard your hearts and your minds in
              Christ Jesus.
              """, ref: "Philippians 4:6-7")
          , Rubric( text:  "A period of silence may follow.")
          , Rubric( text:  "Prayers may be offered for ourselves and others.")
          , LordsPrayer()
          , SectionTitle( text: "The Collect")
          , Paragraph( text: """
              Blessed Savior, at this hour you hung upon the Cross, stretching
              out your loving arms: Grant that all the peoples of the earth
              may look to you and be saved; for your tender mercies’ sake.
              Amen.
              """)
      ]
    );
  }
}

class _Evening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
          SectionTitle(text: "In the Early Evening")
        , Rubric( text:  "This devotion may be used before or after the evening meal.")
        , Rubric( text:  "The following or some other verse of Scripture is said")

        , Line( indent: 1,  text: "How excellent is your mercy, O God!")
        , Line( indent: 1,  text: "The children of men shall take refuge under the shadow")
        , Line( indent: 1,  text: "of your wings.")
        , Line( indent: 1,  text: "For with you is the well of life,")
        , Line( indent: 1,  text: "and in your light shall we see light.")
        , Reference("Psalm 36:7, 9")

        , SectionTitle( text: "Phos Hilaron O Gladsome Light")
        , SectionTitle( text: "O gladsome light,")

        , Line( indent: 1,  text: "pure brightness of the everliving Father in heaven, *")
        , Line( indent: 1,  text: "O Jesus Christ, holy and blessed!")
        , Line( indent: 1,  text: "Now as we come to the setting of the sun,")
        , Line( indent: 1,  text: "and our eyes behold the vesper light, *")
        , Line( indent: 1,  text: "we sing your praises, O God: Father, Son, and Holy Spirit.")
        , Line( indent: 1,  text: "You are worthy at all times to be praised by happy voices, *")
        , Line( indent: 1,  text: "O Son of God, O Giver of Life,")
        , Line( indent: 1,  text: "and to be glorified through all the worlds.")
        , SectionTitle( text: "a reading from holy scripture")
        , ScriptureRef( text: """
            For what we proclaim is not ourselves, but Jesus Christ as Lord,
            with ourselves as your servants for Jesus’ sake. For God, who
            said, “Let light shine out of darkness,” has shone in our hearts,
            to give the light of the knowledge of the glory of God in the
            face of Jesus Christ.
            """, ref: "2 Corinthians 4:5-6")
        , Rubric( text:  "or this")
        , ScriptureRef( text: """
            Jesus spoke to them, saying, “I am the light of the world.
            Whoever follows me will not walk in darkness, but will have the
            light of life.”
            """, ref: "John 8:12")
        , Rubric( text: "or this")
        , ScriptureRef( text: """
          Jesus said, “Behold, I stand at the door and knock. If anyone
          hears my voice and opens the door, I will come in to him and
          eat with him, and he with me.”
          """, ref: "Revelation 3:20")
        , Rubric( text:  "A period of silence may follow.")
        , Rubric( text:  "A hymn or canticle may be used; the Apostles’ Creed (page 75) may be said. Prayers may be offered for ourselves and others.")
        , LordsPrayer()
        , SectionTitle( text: "the collect")
        , Paragraph( text: """
            Lord Jesus, stay with us, for evening is at hand and the day
            is past; be our companion in the way, kindle our hearts, and
            awaken hope, that we may know you as you are revealed in
            Scripture and the breaking of bread. Grant this for the sake of
            your love. Amen.
            """)
      ],
    );
  }
}

class _Night extends StatefulWidget {
  @override
  __NightState createState() => __NightState();
}

class __NightState extends State<_Night> {
  bool apostlesCreed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
      , children: <Widget>[
            SectionTitle(text: "At the End of the Day",)
          , Rubric( text:  "The following or some other verse of Scripture is said")
          , ScriptureRef( text: """
                I will lay me down in peace, and take my rest;
          ,     for you, Lord, only, make me dwell in safety.
                """, ref: "Psalm 4:8")

          , SectionTitle( text: "Psalm 134")
          , SectionTitle( italic: true, text: "Ecce nunc")
          , Line( text: "1 Behold now, praise the Lord, *")
          , Line( indent: 1,  text: "all you servants of the Lord, ")
          , Line( text: "2 You that stand by night in the house of the Lord, *")
          , Line( indent: 1,  text: "even in the courts of the house of our God.")
          , Line( text: "3 Lift up your hands in the sanctuary *")
          , Line( indent: 1,  text: "and sing praises unto the Lord.")
          , Line( text: " 4 The Lord who made heaven and earth *")
          , Line( indent: 1,  text: "give you blessing out of Zion.")
          , SectionTitle( text: "A Reading From Holy Scripture")
          , ScriptureRef( text: """
              You keep them in perfect peace whose minds are stayed on you,
              because they trust in you. Trust in the Lord for ever, for the
              Lord God is an everlasting rock.
              """, ref: "Isaiah 26:3-4t")
          , Rubric( text:  "or this")
          , ScriptureRef( text: """
              Now may the God of peace himself sanctify you completely,
              and may your whole spirit and soul and body be kept blameless
              at the coming of our Lord Jesus Christ.
              """, ref: "1 Thessalonians 5:23")
          , Rubric( text:  "A period of silence may follow.")
          , Rubric( text:  "A hymn or canticle may be used.")
          , Rubric( text:  "Prayers may be offered for ourselves and others. It is appropriate that prayers of thanksgiving for the blessings of the day, and penitence for our sins, be included.")
          , LordsPrayer()
          , SectionTitle( text: "The Collect")
          , Paragraph( text:"""
              Visit this place, O Lord, and drive far from it all snares of the
              enemy; let your holy angels dwell with us to preserve us in
              peace; and let your blessing be upon us always; through Jesus
              Christ our Lord. Amen.
              """)
          , SectionTitle( text: "nunc dimittis")
          , SectionTitle( italic: true, text: "The Song of Simeon")
          , Line( text: "Lord, now let your servant depart in peace, *")
          , Line( indent: 1,  text: "according to your word.")
          , Line( text: "For my eyes have seen your salvation, *")
          , Line( indent: 1,  text: "which you have prepared before the face of all people;")
          , Line( text: "To be a light to lighten the Gentiles, *")
          , Line( indent: 1,  text: "and to be the glory of your people Israel.")
          , Gloria()
          , Reference("Luke 2:29-32")
          , SectionTitle( text: "Concluding Sentence")
          , Paragraph( text: """
              The almighty and merciful Lord, Father, Son, and Holy Spirit,
              bless us and keep us, this night and evermore. Amen.
              """)
          , Rubric( text:  "When the Apostles Creed is included in Family Prayer, the text is as follows:")
          , RaisedButton(
                child: Text("Apostles' Creed")
              , onPressed: () { setState( () => apostlesCreed = !apostlesCreed ); },
            )
          , apostlesCreed ? ApostlesCreed() : Container()
        ]
    );
  }
}

class _AdditionalPrayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start
        , children: <Widget>[
              SectionTitle(text: "For the Spirit of Prayer")
            , Paragraph( text: """
                O Almighty God, you pour out on all who desire it the spirit
                of grace and of supplication: Deliver us, when we draw near to
                you, from coldness of heart and wanderings of mind, that with
                steadfast thoughts and kindled affections we may worship you in
                spirit and in truth; through Jesus Christ our Lord. Amen.
                """)
            , SectionTitle(text: "For Those We Love")
            , Paragraph( text: """
                God, we entrust all who are dear to us to your neverfailing care and love, for this life and the life to come, knowing
                that you are doing for them better things than we can desire or
                pray for; through Jesus Christ our Lord. Amen.
                """)
            , SectionTitle(text: "For the Family")
            , Paragraph( text: """
                Merciful Savior, you loved Martha and Mary and Lazarus,
                hallowing their home with your sacred presence: Bless our
                home, we pray, that your love may rest upon us, and that your
                presence may dwell with us. May we all grow in grace and in
                the knowledge of you, our Lord and Savior. Teach us to love one
                another as you have commanded. Help us to bear one another’s
                burdens in fulfillment of your law, O blessed Jesus, who with the
                Father and the Holy Spirit live and reign, one God, for ever and
                ever. Amen.
                """)
            , SectionTitle(text: "For Relatives and Friends")
            , Paragraph( text: """
                O Loving Father, we commend to your gracious keeping all
                who are near and dear to us. Have mercy upon any who are sick,
                and comfort those who are in pain, anxiety, or sorrow. Awaken
                all who are careless about eternal things. Bless those who
                are young and in health, that they may give the days of their
                strength to you. Comfort the aged and infirm, that your peace
                may rest upon them. Hallow the ties of kindred, that we may
                help and not hinder one another in all the good works that you
                have prepared for us to walk in; through Jesus Christ our Lord.
                Amen.
                """)
            , SectionTitle(text: "For Children")
            , Paragraph( text: """
                O Lord Jesus Christ, who took little children into your arms
                and blessed them: Bless the children of this family, that they
                may grow up in godly fear and love. Give them your strength
                and guidance day by day, that they may continue in your love
                and service to their lives’ end. Grant this, O blessed Savior, for
                your own Name’s sake. Amen.
                """)
            , SectionTitle(text: "In the Morning")
            , Paragraph( text:"""
                O God, the King eternal, whose light divides the day from the
                night and turns the shadow of death into the morning: Drive
                far from us all wrong desires, incline our hearts to keep your
                law, and guide our feet into the way of peace; that, having done
                your will with cheerfulness during the day, we may, when night
                comes, rejoice to give you thanks; through Jesus Christ our
                Lord. Amen.
                """)
            , SectionTitle(text: "At Night")
            , Paragraph( text: """
                O Lord, support us all the day long through this trouble-filled
                life, until the shadows lengthen, and the evening comes, and the
                busy world is hushed, and the fever of life is over, and our work
                is done. Then in your mercy grant us a safe lodging, and a holy
                rest, and peace at the last. Amen.
                """)
            , SectionTitle(text: "For Quiet Confidence")
            , Paragraph( text: """
                O God of peace, who hast taught us that in returning and rest
                we shall be saved, in quietness and in confidence shall be our
                strength: By the might of thy Spirit lift us, we pray thee, to thy
                presence, where we may be still and know that thou art God;
                through Jesus Christ our Lord. Amen.
                """)
            , SectionTitle(text: "Family Responses Before Meals")
            ,SectionTitle( italic: true, text: "Traditional")
            , Line( text: "The eyes of all wait upon thee, O Lord;")
            , Line( indent: 1, bold: true, text: "And thou givest them their meat in due season.")
            , Line( text: "Thou openest thine hand;")
            , Line( indent: 1, bold: true, text: "And fillest all things living with plenteousness.")
            , Line( text: "Bless us, O Lord, and these thy gifts, which we are about to receive from thy bounty, through Christ our Lord. Amen.")
            , SectionTitle( text: "A grace Before Meals")
            , Line( text: "Bless, O Lord, these gifts to our use, and us to your service, and make us ever mindful of the needs of others, through Jesus Christ our Lord.")
            , Line(text: "Amen")

          ]
    );
  }
}


/*
    <button on:click={ e => morning = !morning} >
    <h2>In The Morning</h2>
    </button>

    {#if morning}
    <div>

    </div>
    {/if}

    <button on:click={ e => midday = !midday} >
    <h2>At Midday</h2>
    </button>

    {#if midday}
    <div>
    </div>
    {/if}

    <button on:click={ e => evening = !evening} >
    <h2>In The Early Evening</h2>
    </button>

    {#if evening}
    <div>

    <button on:click={ e => night = !night} >
    <h2>At the End of the Day</h2>
    </button>

    </p>
    , Rubric( text:  "When the Apostles Creed is included in Family Prayer, the text is as follows:")
    </div>
    {/if}
    <button on:click={ e => creed = !creed} >
    <h2>Apostles Creed</h2>
    </button>
    {#if creed}
    <div>
    <ApostlesCreed />
    </div>
    {/if}


    , SectionTitle( text: "advent antiphons")
    , Rubric( text:  "In Advent, using the Antiphons found in the Calendar of Holy Days and Commemorations (page 712), families might consider singing the appropriate verse of the hymn “O Come, O Come, Emmanuel” each night beginning on December 16."}
    />

 */