import 'package:flutter/material.dart';
import 'package:legereme/helpers/lesson.dart';
import 'package:legereme/helpers/paragraph.dart';

class OLItem {
  String key;
  String title;
  bool show = false;
  List<String> content; // sometimes more than one

  OLItem(String key, String title, List<String> content) {
    this.key = key;
    this.title = title;
    this.content = content;
  }

}

BoxDecoration boxDecoration = BoxDecoration
  ( color: Colors.grey[100]
    , border: Border.all
      ( color: Colors.blue
        , width: 2
    )
    , borderRadius: BorderRadius.circular(8)
    , boxShadow:
    [ BoxShadow
      ( color: Colors.grey.withOpacity(0.5)
        , spreadRadius: 5
        , blurRadius: 7
        , offset: Offset(0, 3) // changes position of shadow
    )
    ]
);

class OverlaySelection extends StatefulWidget {
  String title;
  List<OLItem> items;
  bool scripture;
  OverlaySelection({Key key, this.title, this.items, this.scripture = false}) : super(key: key);
  @override
  _OverlaySelectionState createState() => _OverlaySelectionState();
}

class _OverlaySelectionState extends State<OverlaySelection> {
  @override

  OverlayEntry overlayEntry;
  OverlayEntry contentOverlayEntry;
  showSelections(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            top: 100.0
            , left: 10.0
            , child:
        Container
          ( decoration: boxDecoration
          , width: 400.0
          , padding: EdgeInsets.all(4)
          , child: Wrap
              ( spacing: 5.0
              , runSpacing: 10.0
              , children: widget.items.map<Widget>( (e) =>
                ButtonTheme
                  ( minWidth: 190.0
                  , child: RaisedButton
                      ( onPressed: ()
                          { showContent(context, e);
                            overlayEntry.remove();
                          }
                      , child: Text( e.title )
                      )
                  )).toList()
            )
        )
        )
    );

    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 5));
    overlayEntry.remove();
  }
  showContent(BuildContext context, OLItem item) async {
    OverlayState contentOverlayState = Overlay.of(context);
    contentOverlayEntry = OverlayEntry(
      builder: (context) => DefaultTextStyle
        ( style: TextStyle(fontSize: 18.0, color: Colors.black87)
          , child: Center(
              child: Positioned
              ( top: 110.0
              , left: 10.0
              , child: Card( child: InkWell
                  ( onTap: () { contentOverlayEntry.remove(); }
                  , child: Container
                    ( decoration: boxDecoration
                    , width: 390.0
                    , height: 300.0
                    , padding: EdgeInsets.all(8.0)
                    , child: widget.scripture ? ScriptureOverlay(item.title) : ShowParagraphs(item.content)
                  )
                )
            )
          )
      )
      )
    );

    contentOverlayState.insert(contentOverlayEntry);
    await Future.delayed(Duration(seconds: 15));
    contentOverlayEntry.remove();
  }

  Widget build(BuildContext context) {
    return RaisedButton
      ( onPressed: () => showSelections(context)
      , child: Text( widget.title));
  }
}

class ShowParagraphs extends StatelessWidget {
  ShowParagraphs(this.content);

  final List<String> content;

  Widget build(BuildContext context) {
    return ListView
      (children: content.map<Widget>(
            (t) => Paragraph(t, style: TextStyle(fontSize: 18.0))).toList()
    );
  }
}

class ScriptureOverlay extends StatelessWidget {
  ScriptureOverlay(this.ref);
  final String ref;
  Widget build(BuildContext context) {
    return ListView( children: <Widget>[ShowScripture(ref)]);
  }
}

