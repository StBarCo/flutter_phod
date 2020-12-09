import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/reusablePieces/confession_short.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/reusablePieces/lamb_of_god.dart';
import 'package:flutter_phod/helpers/lesson.dart';
import 'package:flutter_phod/helpers/reusablePieces/lords_prayer.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/pick_one.dart';
import 'package:flutter_phod/helpers/reusablePieces/post_communion_prayer.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/parts/scripture_ref.dart';

import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/stores/overlay_selection.dart';


class CommunionToSick extends StatefulWidget {
  @override
  _CommunionToSickState createState() => _CommunionToSickState();
}

class _CommunionToSickState extends State<CommunionToSick> {
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
      title: 'Communion to the Sick',
      body: DefaultTextStyle
        ( style: TextStyle(fontSize: 18.0, color: Colors.black87)
        , child: ListView
            ( controller: _scrollController
            , padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
            , children: <Widget>
              [ PageHeader(litDay: LitDay().init())
              , Rubric( text:  """
                  This rite is used when the consecrated elements are brought 
                  from an earlier celebration of Holy Communion.
                  """)
              , Rubric( text: "The Minister says")
              , ScriptureRef( text: """
                  Grace to you and peace from God our Father and the Lord Jesus Christ.
                  """, ref: "Philippians 1:2")
              , Rubric( text: "The Minister continues")
              , Paragraph( text: """
                  Almighty God, to you all hearts are open, all desires known,
                  and from you no secrets are hid: Cleanse the thoughts of our
                  hearts by the inspiration of your Holy Spirit, that we may
                  perfectly love you, and worthily magnify your holy Name;
                  through Christ our Lord. *Amen*.
                  """)
              , Rubric( text: "One of the following Gospel lessons is read, or the readings appropriate to the day.")
              , ScriptureRef( text: """
                  God so loved the world, that he gave his only-begotten Son,
                  that whoever believes in him should not perish but have eternal life.
                  """, ref: "John 3:16t")
              , ScriptureRef( text: """
                  Jesus said, “I am the living bread that came down from heaven.
                  If anyone eats of this bread, he will live forever. And the
                  bread that I will give for the life of the world is my flesh.
                  For my flesh is true food, and my blood is true drink. Whoever
                  feeds on my flesh and drinks my blood abides in me, and I in him.”
                  """, ref: "John 6:51, 55-56")
              , _AdditionalScripture()
              , Rubric( text: """
                  Reflection on the Lessons may follow. Additional prayers may
                  be offered. The Minister may say the Confession, and the sick 
                  person joins in as able.
                  """)
              , OverlaySelection(title: "Additional Prayers", items: _additionalPrayers)
              , ConfessionShort()
              , Rubric( text: "A Priest, if present, says")
              , Paragraph( text: """
                  Almighty God, our heavenly Father, who in his great mercy has
                  promised forgiveness of sins to all those who sincerely repent
                  and with true faith turn to him, have mercy upon you, pardon
                  and deliver you from all your sins, confirm and strengthen
                  you in all goodness, and bring you to everlasting life;
                  through Jesus Christ our Lord. *Amen*.
                  """)
              , Rubric( text: "A Deacon or lay person prays")
              , Paragraph( text: """
                  Grant to your faithful people, merciful Lord, pardon and peace;
                  that we may be cleansed from all our sins, and serve you with 
                  a quiet mind; through Jesus Christ our Lord. *Amen*.
                  """)
              , Versical( speaker: "Minister", text: "The peace of the Lord be always with you.")
              , Versical( speaker: "People", text: "And with your spirit.")
              , Versical( speaker: "Minister", text: "Let us pray.")
              , Rubric( text: "Minister and People")
              , LordsPrayer()
              , Rubric( text: "Then may be said")
              , LambOfGod()
              , Rubric( text: "The minister may say")
              , Paragraph( text: """
                  The Gifts of God for the People of God. Take them in 
                  remembrance that Christ died for you, and feed on him in your 
                  hearts by faith, with thanksgiving.
                  """)
              , Rubric( text: "The Sacrament is then distributed with the following words")
              , Paragraph( text: """
                  The Body of our Lord Jesus Christ, which was given for you, 
                  preserve your body and soul to everlasting life.
                  """)
              , Paragraph( text: """
                  The Blood of our Lord Jesus Christ, which was shed for you, 
                  preserve your body and soul to everlasting life.
                  """)
              , PostCommunionPrayer()
              , Rubric( text: "A Priest gives this blessing")
              , Paragraph( text: """
                  The peace of God which passes all understanding keep your
                  hearts and minds in the knowledge and love of God, and of
                  his Son Jesus Christ our Lord; and the blessing of God
                  Almighty, the Father, the Son, and the Holy Spirit, be among
                  you, and remain with you always. *Amen*.
                  """)
              , Rubric( text: "A Deacon or lay person says the following")
              , ScriptureRef( text: """
                  The grace of our Lord Jesus Christ, and the love of God, and 
                  the fellowship of the Holy Spirit, be with us all evermore. Amen.
                  """, ref: "2 Corinthians 13:14t")
              , Versical( speaker: "Minister", text: "Let us bless the Lord.")
              , Versical( speaker: "People", text: "Thanks be to God.")

              ],
            )
        )
    );

  }
}
// TODO Implement this library.

class _AdditionalScripture extends StatefulWidget {
  @override
  __AdditionalScriptureState createState() => __AdditionalScriptureState();
}

class __AdditionalScriptureState extends State<_AdditionalScripture> {
  String additionalScriptures;
  String thisSection;
  String thisScripture;
  final Map sectionLabels =
  { 'suffering': "Suffering"
  , 'healing': 'Healing'
  , 'hope': "Eternity"
  };
  final Map references =
  { 'suffering':
      [ OLItem("Isaiah_53", "Isaiah 53", [])
      , OLItem("1_Peter_2:21-25", "1 Peter 2:21-25", [])
      , OLItem("1_Thessalonians_5:16-24", "1 Thessalonians 5:16-24", [])
      , OLItem("2_Corinthians_12:7-10", "2 Corinthians 12:7-10", [])
      , OLItem("Romans_8:18-39", "Romans 8:18-39", [])
      ]
  , 'healing':
      [ OLItem("James_5:13-20", "James 5:13-20", [])
      , OLItem("Luke_5:12-26", "Luke 5:12-26", [])
      , OLItem("Luke_13:10-17", "Luke 13:10-17", [])
      , OLItem("Acts_3:1-10", "Acts 3:1-10", [] )
      ]
  , 'hope':
      [ OLItem("Luke_2:25-35", "Luke 2:25-35", [])
      , OLItem("John_14", "John 14", [])
      , OLItem("1_Corinthians_15:42-58", "1 Corinthians 15:42-58", [])
      , OLItem("2_Corinthians_4:7-18", "2 Corinthians 4:7-18", [])
      , OLItem("1_Thessalonians_4:13-18", "1 Thessalonians 4:13-18", [])
      ]
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>
        [ SectionTitle(text: "Scriptures For Use By A Sick Person")
        , Row
            ( mainAxisAlignment: MainAxisAlignment.spaceBetween
            , children: sectionLabels.entries.map<Widget>( (e) =>
                OverlaySelection(title: e.value, items: references[e.key], scripture: true) ).toList()
            )
        /*
        , ButtonBar(
            alignment: MainAxisAlignment.start
          , mainAxisSize: MainAxisSize.min
          , children: sectionLabels.entries.map<Widget>( (e) {
            return RaisedButton
              ( child: Text(e.value)
              , onPressed: () => setState( () => additionalScriptures = e.key)
              );
          }).toList()
        )
        , (additionalScriptures == null) ? Container() : ButtonBar(
              alignment: MainAxisAlignment.start
            , mainAxisSize: MainAxisSize.min
            , children: references[additionalScriptures].map<Widget>( (ref) {
                return RaisedButton
                  ( child: Text(ref)
                  , onPressed: () => setState( () => thisScripture = ref)
                  );
              }).toList()
            )
        , (thisScripture == null)
            ? Container()
            : ShowScripture(ref: thisScripture) // do something smart here

         */
        , Rubric( text:  "See also the Selections of Psalms on page 269.")
        ]
    );
  }
}


final List<OLItem> _additionalPrayers =
[ OLItem( "sickPerson"
        , "For A Sick Person"
        , [ """
            O Father of mercies and God of all comfort, our only help in time of
            need: We humbly beseech you to behold, visit, and relieve your sick
            servant N. for whom our prayers are desired. Look upon him with the
            eyes of your mercy; comfort him with a sense of your goodness; preserve
            him from the temptations of the enemy; and give him patience under
            his affliction. In your good time, restore him to health, and enable
            him to lead the remainder of his life in your fear, and to your glory;
            and grant that finally he may dwell with you in life everlasting;
            through Jesus Christ our Lord. *Amen*."""
          ]
        )
, OLItem( "recovery"
        , "Recovery From Sickness"
        , [ """
            O God, the strength of the weak and the comfort of sufferers:
            Mercifully accept our prayers, and grant to your servant N. the
            help of your power, that his sickness may be turned into health,
            and our sorrow into joy; through Jesus Christ our Lord. *Amen*."""
          , """
            O God of heavenly powers, by the might of your command you drive
            away from our bodies all sickness and infirmity: Be present in your
            goodness with your servant N., that his weakness may be banished and
            his strength restored; and that, his health being renewed, he may
            bless your holy Name; through Jesus Christ our Lord. *Amen*."""
          ]
        )
, OLItem(  "sickChild"
        , "For A Sick Child"
        , [ """
            Heavenly Father, watch with us over your child N., and grant that
            he may be restored to that perfect health which it is yours alone to
            give; through Jesus Christ our Lord. *Amen*."""
          , """
            Lord Jesus Christ, Good Shepherd of the sheep, you gather the lambs
            in your arms and carry them in your bosom: We commend to your loving
            care this child N. Relieve his pain, guard him from all danger,
            restore to him your gifts of gladness and strength, and raise him
            up to a life of service to you. Hear us, we pray, for your dear
            Name’s sake. *Amen*."""
          ]
        )
, OLItem( "operation"
        , "Before An Operation"
        , [ """
            Almighty God, our heavenly Father, graciously comfort your servant
            N. in his suffering, and bless the means used for his cure.
            Though at times he may be afraid, fill his heart with confidence
            that he may yet put his trust in you; through Jesus Christ our Lord. *Amen*.
            """
          ]
        )
, OLItem( "strength"
        , "Strength And Confidence"
        , [ """
          Heavenly Father, giver of life and health: Comfort and relieve your
          sick servant N., and give your power of healing to those who minister
          to his needs, that he may be strengthened in his weakness and have 
          confidence in your loving care; through Jesus Christ our Lord. *Amen*.
          """
          ]
        )
, OLItem( "sanctification"
        , "Sanctification Of Illness"
        , [ """
          Sanctify, O Lord, the sickness of your servant N., that the sense of 
          his weakness may add strength to his faith and seriousness to his 
          repentance; and grant that he may live with you in everlasting life; 
          through Jesus Christ our Lord. *Amen*."""
          ]
        )
, OLItem( "bodyAndSoul"
        , "Health Of Body And Soul"
        , [ """
          May God the Father bless you, God the Son heal you, God the Holy 
          Spirit give you strength. May God the holy and undivided Trinity 
          guard your body, save your soul, and bring you safely to his heavenly 
          country; where he lives and reigns for ever and ever. *Amen*."""
        ]
        )
, OLItem( "beginning"
        , "Beginning Of Recovery" // "Thanksgiving For A Beginning Of Recovery"
        , [ """
          O Lord, your compassions never fail, and your mercies are new every 
          morning: We give you thanks for giving our brother N. both relief 
          from pain and hope of health renewed. Continue in him, we pray, the 
          good work you have begun; that he, daily increasing in bodily strength, 
          and rejoicing in your goodness, may so order his life that he may 
          always think and do those things that please you; through Jesus Christ 
          our Lord. *Amen*."""
          ]
        )
, OLItem( "littleHope"
        , "Little Hope Of Recovery"
        , [ """
          O Father of mercies and God of all comfort, our only help in time of 
          need; We fly to you for aid on behalf of this your servant, here lying 
          in great weakness of body. Look graciously upon him, O Lord; that as 
          he outwardly fades away, you would strengthen him inwardly with your 
          grace and Holy Spirit. Give him true repentance for all the errors of 
          his life, and steadfast faith in your Son Jesus; that his sins may be 
          done away by your mercy, and his pardon sealed in heaven; through your 
          Son Jesus Christ, our Lord and Savior. *Amen*."""
          ]
        )
, OLItem( "trust"
        , "For Trust In God"
        , [ """
          O God, the source of all health: So fill my heart with faith in your 
          love, that with calm expectancy I may make room for your power to 
          possess me, and gracefully accept your healing; through Jesus Christ 
          our Lord. *Amen*."""
          ]
        )
, OLItem( "pain"
        , "In Pain"
        , [ """
          Lord Jesus Christ, by your patience in suffering you hallowed earthly 
          pain and gave us the example of obedience to your Father’s will: Be 
          near me in my time of weakness and pain; sustain me by your grace, 
          that my strength and courage may not fail; heal me according to your 
          will; and help me always to believe that what happens to me here is 
          of little account if you hold me in eternal life, my Lord and my God. 
          *Amen*."""
          ]
        )
, OLItem( "medicine"
        , "When Taking Medicine"
        , [ """
          Almighty God, in your goodness you created the earth and all its 
          elements, and have given us skill to make medicines that heal and 
          relieve our pain. All healing comes from you, and in you I put my 
          trust. Grant that this medication may, in your mercy, give comfort 
          and bring healing to my body; through Jesus Christ our Lord. *Amen*."""
          ]
        )
, OLItem( "sleep"
        , "For Sleep"
        , [ """
          O heavenly Father, you give your children sleep for the refreshing of 
          soul and body: Grant me this gift, I pray; keep me in that perfect 
          peace which you have promised to those whose minds are fixed on you; 
          and give me such a sense of your presence, that in the hours of silence 
          I may enjoy the blessed assurance of your love; through Jesus Christ 
          our Lord. *Amen*."""
          ]
        )
, OLItem( "morning"
        , "In The Morning"
        , [ """
          This is another day, O Lord. I know not what it will bring forth, but 
          make me ready, Lord, for whatever it may be. If I am to stand up, help 
          me to stand bravely. If I am to sit still, help me to sit quietly. If 
          I am to lie low, help me to do it patiently. And if I am to do nothing, 
          help me to do it gallantly. Make these words more than words, and give 
          me the Spirit of Jesus. *Amen*."""
          ]
        )
];
/*
class _AdditionalPrayersButtonBar extends StatefulWidget {
  @override
  __AdditionalPrayersButtonBarState createState() => __AdditionalPrayersButtonBarState();
}

class __AdditionalPrayersButtonBarState extends State<_AdditionalPrayersButtonBar> {
  String thisPrayer;


  @override
  Widget build(BuildContext context) {
    return Hero
      ( tag: 'pickOne'
      , child: PickOne(data: labels, label: "Additional Prayers")
      );
    /*
    return Column(
      children:
        [
          [ ButtonBar(
              alignment: MainAxisAlignment.start
            //, mainAxisSize: MainAxisSize.min
            , children: labels.entries.map((e) {
              return RaisedButton(
                  child: Text(e.value)
                ,
                , onPressed: () { setState(() => thisPrayer = e.key);},
              );
            }).toList()
          )
          ]
          , (thisPrayer == null)
            ? [ Container() ]
            : prayers[thisPrayer].map<Widget>( (p) => Paragraph( text: p ) ).toList()
        ].expand<Widget>((element) => element).toList(),
    );

     */




  }
}

 */

