import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/canticle_show.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/pop_up.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phod/services/canticles_db.dart';
import 'package:flutter_phod/helpers/parts.dart';
import 'package:flutter_phod/helpers/canticle_list.dart';

class Canticles extends StatefulWidget {
  @override
  _CanticlesState createState() => _CanticlesState();
}

class _CanticlesState extends State<Canticles> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Canticle>>.value(
      value: CanticleDB().canticles,
      child: IphodScaffold(
          context: context,
          title: 'Canticles',
          body:  SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child:
              CanticleListContainer(),

            ),
          ),
    );
  }

}

