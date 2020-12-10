import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';

class GeneralThanksgiving extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: "The General Thanksgiving",),
        PhrasedParagraph(content: [
            Line( text: "Almighty God, Father of all mercies,")
          , Line( indent: 1, text: "we your unworthy servants give you humble thanks")
          , Line( indent: 1, text: "for all your goodness and loving-kindness")
          , Line( indent: 1, text: "to us and to all whom you have made.")
          , Line( text: "We bless you for our creation, preservation,")
          , Line( indent: 1, text: "and all the blessings of this life;")
          , Line( indent: 1, text: "but above all for your immeasurable love")
          , Line( indent: 1, text: "in the redemption of the world by our Lord Jesus Christ;")
          , Line( indent: 1, text: "for the means of grace, and for the hope of glory.")
          , Line( text: "And, we pray, give us such an awareness of your mercies,")
          , Line( indent: 1, text: "that with truly thankful hearts we may show forth your praise,")
          , Line( indent: 1, text: "not only with our lips, but in our lives,")
          , Line( indent: 1, text: "by giving up our selves to your service,")
          , Line( indent: 1, text: "and by walking before you")
          , Line( indent: 1, text: "in holiness and righteousness all our days;")
          , Line( text: "Through Jesus Christ our Lord,")
          , Line( indent: 1, text: "to whom, with you and the Holy Spirit,")
          , Line( indent: 1, text: "be honor and glory throughout all ages. Amen.")
          ]
        ),
      ],
    );
  }
}
