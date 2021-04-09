import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legereme/controllers/psalmController.dart';
import 'package:legereme/helpers/show_one_psalms.dart';

PsalmController c = Get.put( PsalmController() );

class Psalms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx( () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: c.psalms.map<Widget>( (p) {
          return ShowOnePsalm(psalm: p);
        }
        ).toList()
      )
    );
  }
}

