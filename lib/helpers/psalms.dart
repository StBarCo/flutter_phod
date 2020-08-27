import 'package:flutter/material.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/stores/daily_psalms.dart';

class Psalms extends StatelessWidget {
  LitDay litDay;
  Pss pss;
  Psalms({Key key, this.litDay, this.pss }) : super(key: key);
  //Pss psalmList = (litDay != null) ? DailyPsalms.getDailyPsalms(litDay, '30DayCycle') : pss;

  @override
  Widget build(BuildContext context) {
    Pss psalmList = (litDay == null) ? pss : getDailyPsalms(litDay, '30DayCycle');
    print('THESE PSALMS: $psalmList');
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Text( 'Psalms go here')
    );
  }
}
