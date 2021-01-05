import 'package:flutter/material.dart';
import 'package:flutter_phod/models/collect.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/controllers/collectController.dart';
import 'package:flutter_phod/models/liturgical_day.dart';
import 'package:flutter_phod/services/collect_db.dart';

CollectController c = Get.put( CollectController() );
class Collect extends StatelessWidget {
  Collect({this.litDay, this.ofType});
  LiturgicalDay litDay;
  String ofType;
  @override
  Widget build(BuildContext context) {;
    CollectModel collect = c.collectOfType(ofType);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "${collect.title}"
          , style: TextStyle( fontSize: 18.0 )
        ),
        Text(
            "${collect.text}"
          , style: TextStyle( fontSize: 14.0 )
        ),
        SizedBox(height: 20.0)
      ]
    );
  }
}
