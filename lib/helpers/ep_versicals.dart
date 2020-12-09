import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';

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
          Versical( speaker: "Officiant", text: "O Lord, show your mercy upon us;")
        , Versical( speaker: "People", text: "And grant us your salvation.")
        , Versical( speaker: "Officiant", text: "O Lord, guide those who govern us;")
        , Versical( speaker: "People", text: "And lead us in the way of justice and truth.")
        , Versical( speaker: "Officiant", text: "Clothe your ministers with righteousness;")
        , Versical( speaker: "People", text: "And let your people sing with joy.")
        , Versical( speaker: "Officiant", text: "O Lord, save your people;")
        , Versical( speaker: "People", text: "And bless your inheritance.")
        , Versical( speaker: "Officiant", text: "Give peace in our time, O Lord;")
        , Versical( speaker: "People", text: "And defend us by your mighty power.")
        , Versical( speaker: "Officiant", text: "Let not the needy, O Lord, be forgotten;")
        , Versical( speaker: "People", text: "Nor the hope of the poor be taken away.")
        , Versical( speaker: "Officiant", text: "Create in us clean hearts, O God;")
        , Versical( speaker: "People", text: "And take not your Holy Spirit from us.")

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
          Versical( speaker: "Officiant", text: "That this evening may be holy, good, and peaceful,")
        , Versical( speaker: "People", text: "We entreat you, O Lord.")
        , Versical( speaker: "Officiant", text: "That your holy angels may lead us in paths of peace and goodwill,")
        , Versical( speaker: "People", text: "We entreat you, O Lord.")
        , Versical( speaker: "Officiant", text: "That we may be pardoned and forgiven for our sins and offenses,")
        , Versical( speaker: "People", text: "We entreat you, O Lord.")
        , Versical( speaker: "Officiant", text: "That there may be peace in your Church and in the whole world,")
        , Versical( speaker: "People", text: "We entreat you, O Lord.")
        , Versical( speaker: "Officiant", text: "That we may depart this life in your faith and fear, and not be condemned before the great judgment seat of Christ,")
        , Versical( speaker: "People", text: "We entreat you, O Lord.")
        , Versical( speaker: "Officiant", text: "That we may be bound together by your Holy Spirit in the communion of [ ___________ and] all your saints, entrusting one another and all our life to Christ,")
        , Versical( speaker: "People", text: "We entreat you, O Lord.")
        ]
    );
  }
}



