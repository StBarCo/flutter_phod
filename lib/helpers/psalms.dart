import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/controllers/psalmController.dart';
import 'package:flutter_phod/helpers/show_one_psalms.dart';

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

