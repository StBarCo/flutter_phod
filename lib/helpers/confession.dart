import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/line.dart';
import 'package:flutter_phod/helpers/rubric.dart';
import 'package:flutter_phod/helpers/section_title.dart';

class Confession extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            SectionTitle(text: 'Confession of Sin')
          , Rubric("The Officiant says to the People")
          , Line( text:
              "Dearly beloved, the Scriptures teach us to acknowledge our many sins and offenses, not concealing them from our heavenly Father, but confessing them with humble and obedient hearts that we may obtain forgiveness by his infinite goodness and mercy. We ought at all times humbly to acknowledge our sins before Almighty God, but especially when we come together in his presence to give thanks for the great benefits we have received at his hands, to declare his most worthy praise, to hear his holy Word, and to ask, for ourselves and on behalf of others, those things which are necessary for our life and our salvation. Therefore, draw near with me to the throne of heavenly grace.")
          , Rubric('or this')
          , Line(text: 'Let us humbly confess our sins to Almight God.')
          , SizedBox(height: 10)
          , Line(text: "Almighty and most merciful Father,")
          , Line(text: "we have erred and strayed from your ways like lost sheep.", indent: true)
          , Line(text: "We have followed too much the devices and desires of our own hearts.")
          , Line(text: "We have offended against your holy laws.")
          , Line(text: "We have left undone those things which we ought to have done,")
          , Line(text: "and we have done those things which we ought not to have done;", indent: true)
          , Line(text: "and apart from your grace, there is no health in us.", indent: true)
          , Line(text: "O Lord, have mercy upon us.")
          , Line(text: "Spare all those who confess their faults.")
          , Line(text: "Restore all those who are penitent, according to your promises declared to all people in Christ Jesus our Lord.")
          , Line(text: "And grant, O most merciful Father, for his sake,")
          , Line(text: "that we may now live a godly, righteous, and sober life,", indent: true)
          , Line(text: "to the glory of your holy Name. Amen.", indent: true)
          , Rubric("The Priest alone stands and says")
          , Line(text: " Almighty God, the Father of our Lord Jesus Christ, desires not the death of sinners, but that they may turn from their wickedness and live. He has empowered and commanded his ministers to pronounce to his people, being penitent, the absolution and remission of their sins. He pardons and absolves all who truly repent and genuinely believe his holy Gospel. For this reason, we beseech him to grant us true repentance and his Holy Spirit, that our present deeds may please him, the rest of our lives may be pure and holy, and that at the last we may come to his eternal joy; through Jesus Christ our Lord. Amen."
          )
          , Rubric('of this')
          , Line(text: " The Almighty and merciful Lord grant you absolution and remission of all your sins, true repentance, amendment of life, and the grace and consolation of his Holy Spirit. Amen."
          )
          , Rubric("A Deacon of layperson remains kneeling and prayers")
          , Line(text: " Grant to your faithful people, merciful Lord, pardon and peace; that we may be cleansed from all our sins, and serve you with a quiet mind; through Jesus Christ our Lord. Amen."
          )
        ]
    );
  }
}
