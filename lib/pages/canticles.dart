import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/show_canticle.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/pop_up.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phod/services/canticles_db.dart';

class Canticles extends StatefulWidget {
  @override
  _CanticlesState createState() => _CanticlesState();
}

class _CanticlesState extends State<Canticles> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Canticle>>.value(
        value: CanticleDB().canticles
      , child: IphodScaffold(
        context: context,
        title: 'Canticles',
        body: DefaultTextStyle(
            style: TextStyle(fontSize: 18.0, color: Colors.black87)
          , child: ListView(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
              , children: <Widget>[
                  PageHeader(litDay: LitDay().init())
                , Text("Canticles go here")
                , CanticleList()
            ],
          ),
        )
      ),
    );
  }
}

class CanticleList extends StatefulWidget {
  @override
  _CanticleListState createState() => _CanticleListState();
}

class _CanticleListState extends State<CanticleList> {
  Canticle thisCanticle;
  @override
  Widget build(BuildContext context) {
    final canticles = Provider.of<List<Canticle>>(context);
    return Stack(
      children:
        [ Column(
            children: canticles.map<Widget>((c) {
              return RaisedButton
                ( child: Text(c.name)
                , onPressed: () { setState(() => thisCanticle = c );}
                );
              }).toList()
            )
        , PopUp( ShowCanticle(canticle: thisCanticle), thisCanticle != null)
        ]
    );
  }
}

