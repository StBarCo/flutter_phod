import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legereme/controllers/psalmController.dart';
import 'package:legereme/helpers/show_one_psalms.dart';
import 'package:legereme/models/psalm_model.dart';
import 'package:legereme/services/psalms_db.dart';

PsalmController c = Get.put( PsalmController() );

class PsalmsPickOne extends StatelessWidget {
  List<Ps> psalms;
  PsalmsPickOne({Key key, this.psalms}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PsalmsDB().getListOfPsalms(psalms);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start
        , children: <Widget>[
          ButtonBar(
          mainAxisSize: MainAxisSize.min
          , children: c.psalmsAvailable.map<Widget>((ps)
          { return RaisedButton(
                onPressed: () => c.select(ps)
              , child: Text("$ps")
            );
          }).toList())
      , Obx( () => ShowOnePsalm(psalm: c.selected))
    ]
    );
  }
}
