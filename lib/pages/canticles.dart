import 'package:flutter/material.dart';
import 'package:legereme/models/canticle.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:legereme/helpers/show_canticle.dart';
import 'package:legereme/helpers/iphod_scaffold.dart';
import 'package:legereme/helpers/pop_up.dart';
import 'package:legereme/helpers/page_header.dart';
import 'package:legereme/controllers/canticleController.dart';

CanticleController controller = Get.put<CanticleController>( CanticleController() );

class Canticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CanticleController>(
        init: controller,
        builder: (CanticleController c) {
          if (c != null && c.canticles != null) {
            return InnerCanticles();
          }
          else {
            Text("Loading...");
          }
        } // end of builder
    );
  }
}

class InnerCanticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Canticles',
        body: DefaultTextStyle(
          style: TextStyle(fontSize: 18.0, color: Colors.black87),
          child: ListView(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
              , children: <Widget>[
                  PageHeader()
                , CanticleList()
            ],
          ),
        )
    );
  }
}

class CanticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:
        [ Column(
            children: controller.canticles.map<Widget>((c) {
              return ObxValue( (canticle) =>
                  Column( children: <Widget>[
                    RaisedButton(
                      onPressed: () => canticle.value = c,
                      child: Text("${c.number} ${c.name}"),
                    ),
                    (canticle.value.id == null )
                      ? Container()
                      : PopUp( ShowCanticle(canticle.value), ( () => canticle.value = CanticleModel() ) )
                  ])
                  , CanticleModel().obs);
              }).toList()
            )
        ]
    );
  }
}

