import 'package:flutter/material.dart';
import 'package:legereme/helpers/line.dart';

class GeneralThanksgiving extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Line( text: "Almighty God, Father of all mercies,")
      , Line( indent: true, text: "we your unworthy servants give you humble thanks")
      , Line( indent: true, text: "for all your goodness and loving-kindness")
      , Line( indent: true, text: "to us and to all whom you have made.")
      , Line( text: "We bless you for our creation, preservation,")
      , Line( indent: true, text: "and all the blessings of this life;")
      , Line( indent: true, text: "but above all for your immeasurable love")
      , Line( indent: true, text: "in the redemption of the world by our Lord Jesus Christ;")
      , Line( indent: true, text: "for the means of grace, and for the hope of glory.")
      , Line( text: "And, we pray, give us such an awareness of your mercies,")
      , Line( indent: true, text: "that with truly thankful hearts we may show forth your praise,")
      , Line( indent: true, text: "not only with our lips, but in our lives,")
      , Line( indent: true, text: "by giving up our selves to your service,")
      , Line( indent: true, text: "and by walking before you")
      , Line( indent: true, text: "in holiness and righteousness all our days;")
      , Line( text: "Through Jesus Christ our Lord,")
      , Line( indent: true, text: "to whom, with you and the Holy Spirit,")
      , Line( indent: true, text: "be honor and glory throughout all ages. Amen.")
      ]
    );
  }
}
