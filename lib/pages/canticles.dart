import 'package:flutter/material.dart';
import 'package:flutter_phod/models/canticle.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_phod/helpers/show_canticle.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/pop_up.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:flutter_phod/controllers/canticleController.dart';

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
                  PageHeader(litDay: LitDay().init())
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
                RaisedButton
                ( child: Text("${c.number} ${c.name}")
                , onPressed: () { controller.showThis(c);
                  }
                );
              }).toList()
            )
        ]
    );
  }
}

