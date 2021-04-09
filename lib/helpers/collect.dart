import 'package:flutter/material.dart';
import 'package:legereme/models/collect.dart';
import 'package:get/get.dart';
import 'package:legereme/controllers/collectController.dart';
import 'package:legereme/models/liturgical_day.dart';

CollectController c = Get.put( CollectController() );
class Collect extends StatelessWidget {
  Collect({this.litDay, this.ofType});
  LiturgicalDay litDay;
  String ofType;
  @override
  Widget build(BuildContext context) {;
    return Obx( () => RenderCollect(collect: c.collectOfType(ofType)));
  }
}

class RenderCollect extends StatelessWidget {
  CollectModel collect;
  RenderCollect({Key key, this.collect}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (collect == null || collect.title == null)
      ? Container()
      : Column(
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
