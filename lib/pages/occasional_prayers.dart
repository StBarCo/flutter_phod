import 'package:flutter/material.dart';
import 'package:flutter_phod/models/occasional_prayer.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/controllers/occasionalPrayerController.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/paragraph.dart';
import 'package:flutter_phod/helpers/pop_up.dart';
// import 'package:flutter_phod/services/occasional_prayers_db.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
// import 'package:flutter_phod/helpers/page_drawer.dart';
import 'package:provider/provider.dart';

OccasionalPrayerController controller = Get.put<OccasionalPrayerController>( OccasionalPrayerController() );

class OccasionalPrayers  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
      title: 'Occasional Prayers',
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          children: <Widget>[
            PageHeader(),
            ListOPs(),
          ]
        )

      )
    );
  }
}

class ListOPs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetX<OccasionalPrayerController>(
        init: controller,
        builder: (OccasionalPrayerController occasionalPrayerController) {
          if (controller != null && controller.all != null) {
            return InnerList();
          }
          else {
            Text("Loading...");
          }
        } // end of builder
    );
  }
}

class InnerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PopUpController popup = Get.put<PopUpController>( PopUpController() );
    return Stack(
        children: [
          Column
          ( children: controller.categories.map<Widget>( (c)
            {
              return ObxValue( (cat) =>
                Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => cat.value = c,
                      child: Text( c )
                    ),
                    (cat.value.length > 0)
                      ? PopUp( ShowThisCategory(cat.value), ( () => cat.value = ""))
                      : Container()
                    ]
                ),
              "".obs);
            }).toList()
          ),
        ]
    );
  }
}

class ShowThisCategory extends StatelessWidget {
  ShowThisCategory(this.category);
  final String category;
  @override
  Widget build(BuildContext context) {
    return Stack (
        children: [
            Column
              ( children: controller.ofCategory(category).map<Widget>( (op) {
              return ObxValue((thisOP) =>
                  Column(
                      children: <Widget>[
                        RaisedButton(
                            onPressed: () => thisOP.value = op,
                            child: Text(op.title)
                        ),
                        (thisOP.value.id == null)
                            ? Container()
                            : PopUp(PrayerDetails(thisOP.value), (() => thisOP.value = OccasionalPrayerModel()))
                      ]
                  ),
                  OccasionalPrayerModel().obs
              );
            }

                ).toList()
              )
            ]
          );
  }
}

class PrayerDetails extends StatelessWidget {
  PrayerDetails(this.prayer);
  final OccasionalPrayerModel prayer;
  @override
  Widget build(BuildContext context) {
    return (prayer == null)
      ? Container()
      : Column
      ( children: <Widget>
        [ Paragraph(prayer.title)
        , Paragraph(prayer.source)
        , Paragraph(prayer.prayer)
        ]
    );
  }
}
