import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopUp extends StatelessWidget {
  PopUp(this.widget, this.closeFn);
  final Widget widget;
  final Function closeFn;

  @override
   Widget build(BuildContext context) {

    return Visibility(
      visible: true
      , child: Center(
        child: Container
        ( child: Column(
          children:
          [ widget
            , Ink
            ( decoration: const ShapeDecoration
            ( color: Colors.lightBlue
              , shape: CircleBorder( )
          )
            , child: IconButton
              ( icon: Icon(Icons.arrow_back_rounded)
                , onPressed: () {
                  closeFn();
                }
                , color: Colors.red
            ),
          )
          ]
    )
          , width: 350.0
          , margin: EdgeInsets.all(10.0)
          , padding: EdgeInsets.all(10.0)
          , decoration: BoxDecoration(
              color: Colors.grey[100]
              , border: Border.all( width: 2.0, color: Colors.blueGrey )
              , borderRadius: BorderRadius.circular(4)
          )
    ),
      ),
    );
  }
}
