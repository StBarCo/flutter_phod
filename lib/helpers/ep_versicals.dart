import 'package:flutter/material.dart';
import 'package:legereme/helpers/versical.dart';

class EPVersicals extends StatefulWidget {
  @override
  _EPVersicalsState createState() => _EPVersicalsState();
}

class _EPVersicalsState extends State<EPVersicals> {
  bool alt = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            setState(() { alt = !alt;});
          },
          child: Text( alt ? "Anytime" : "For Evening" )
        ),
        alt ? AnytimeVersicals() : ForEveningVersicals()
      ]
    );
  }
}

class AnytimeVersicals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          Versical( speaker: "Officiant", says: "O Lord, show your mercy upon us;")
        , Versical( speaker: "People", says: "And grant us your salvation.")
        , Versical( speaker: "Officiant", says: "O Lord, guide those who govern us;")
        , Versical( speaker: "People", says: "And lead us in the way of justice and truth.")
        , Versical( speaker: "Officiant", says: "Clothe your ministers with righteousness;")
        , Versical( speaker: "People", says: "And let your people sing with joy.")
        , Versical( speaker: "Officiant", says: "O Lord, save your people;")
        , Versical( speaker: "People", says: "And bless your inheritance.")
        , Versical( speaker: "Officiant", says: "Give peace in our time, O Lord;")
        , Versical( speaker: "People", says: "And defend us by your mighty power.")
        , Versical( speaker: "Officiant", says: "Let not the needy, O Lord, be forgotten;")
        , Versical( speaker: "People", says: "Nor the hope of the poor be taken away.")
        , Versical( speaker: "Officiant", says: "Create in us clean hearts, O God;")
        , Versical( speaker: "People", says: "And take not your Holy Spirit from us.")

        ]
    );
  }
}
class ForEveningVersicals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          Versical( speaker: "Officiant", says: "That this evening may be holy, good, and peaceful,")
        , Versical( speaker: "People", says: "We entreat you, O Lord.")
        , Versical( speaker: "Officiant", says: "That your holy angels may lead us in paths of peace and goodwill,")
        , Versical( speaker: "People", says: "We entreat you, O Lord.")
        , Versical( speaker: "Officiant", says: "That we may be pardoned and forgiven for our sins and offenses,")
        , Versical( speaker: "People", says: "We entreat you, O Lord.")
        , Versical( speaker: "Officiant", says: "That there may be peace in your Church and in the whole world,")
        , Versical( speaker: "People", says: "We entreat you, O Lord.")
        , Versical( speaker: "Officiant", says: "That we may depart this life in your faith and fear, and not be condemned before the great judgment seat of Christ,")
        , Versical( speaker: "People", says: "We entreat you, O Lord.")
        , Versical( speaker: "Officiant", says: "That we may be bound together by your Holy Spirit in the communion of [ ___________ and] all your saints, entrusting one another and all our life to Christ,")
        , Versical( speaker: "People", says: "We entreat you, O Lord.")
        ]
    );
  }
}



