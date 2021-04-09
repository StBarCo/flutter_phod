import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legereme/models/pages.dart';
import 'package:legereme/controllers/liturgicalCalendarController.dart';


class PageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LiturgicalCalendarController lcc = Get.put( LiturgicalCalendarController() );
    return Drawer(
        child: ListView(
            children: Pages().list.map( (p) =>
                ListTile(
                    title: Text('${p.label}'),
                    onTap: () {
                      switch(p.widget.toString()) {
                        case "MorningPrayer":
                          lcc.selectService("mp"); break;
                        case "EveningPrayer":
                          lcc.selectService("ep"); break;
                      }
                      Get.to(p.widget);
                    }
                )
            ).toList()
        )
    );

  }
}
