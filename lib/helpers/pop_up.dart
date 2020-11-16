import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  PopUp(this.widget, this.ready);
  Widget widget;
  bool ready;
  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.ready
      , child: Container
      ( child: Column(
        children:
        [ widget.widget
          , Ink
          ( decoration: const ShapeDecoration
          ( color: Colors.lightBlue
            , shape: CircleBorder( )
        )
          , child: IconButton
            ( icon: Icon(Icons.arrow_back_rounded)
              , onPressed: () => setState( () => widget.ready = false )
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
    );
  }
}
