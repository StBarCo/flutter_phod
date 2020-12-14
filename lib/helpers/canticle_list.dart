import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/canticle_show.dart';

import 'package:provider/provider.dart';
import 'package:flutter_phod/services/canticles_db.dart';
import 'package:flutter_phod/helpers/parts.dart';

class CanticleListContainer extends StatefulWidget{
  final String recommended;

  CanticleListContainer({this.recommended});

  @override
  _CanticleListContainerState createState() => _CanticleListContainerState();
}

class _CanticleListContainerState extends State<CanticleListContainer>{
  @ override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamProvider<List<Canticle>>.value(
      value: CanticleDB().canticles,
      child: CanticleList(widget.recommended)
    );
  }

}

class CanticleList extends StatefulWidget {
  String recommended;

  CanticleList( this.recommended);
  @override
  _CanticleListState createState() => _CanticleListState();
}

class _CanticleListState extends State<CanticleList> {
  Canticle thisCanticle;

  @override
  Widget build(BuildContext context) {
    final List<Canticle> canticles = Provider.of<List<Canticle>>(context);
    if(canticles == null){
      return Container();
    }
    if(widget.recommended != null){
      thisCanticle ??= canticles.firstWhere((Canticle c ) => c.id == widget.recommended);
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton(
            value: thisCanticle,
            hint: Text('Select a Canticle.'),
            isExpanded: true,
            itemHeight: 90,

            // itemHeight: 200,
            underline: Container(
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Theme.of(context).primaryColorDark),
            onChanged: (Canticle c) {
              setState(() {
                thisCanticle = c;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return canticles.map<Widget>((Canticle c) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(
                      text: makeCanticleHeader(c.number, c.name, recommended: widget.recommended == c.id),
                      leadingSpace: 0,
                      trailingSpace: 5,
                    ),
                  ],
                );
              }).toList();
            },
            items: canticles.map((c) {
              // int index = entry.key;
              // Canticle c = entry.value;
              if(c != null) {
                return DropdownMenuItem(
                    value: c,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          text:makeCanticleHeader(c.number, c.name, recommended: widget.recommended == c.id),
                          leadingSpace: 0,
                          trailingSpace: 0,
                        ),
                        ItemTitle(
                          text: c.title,
                          leadingSpace: 0,
                          trailingSpace: 0,
                          indent: 1,
                        ),
                        Rubric(
                          text: c.notes,
                          leadingSpace: 0,
                          trailingSpace: 20,
                          indent: 1,
                        ),
                      ],
                    ));
              }
            }).toList(),

          ),

          thisCanticle == null ? Container() : ShowCanticle(canticle: thisCanticle),
        ]);
  }

  String makeCanticleHeader(String number, String name, {bool recommended = false}){
    String h = name;

    if(number.isNotEmpty){
      h = number + ": " + name;
    }

    if(recommended){
      h = h + "*";
    }

    return h;
  }
}
