part of '../parts.dart';

class ScriptureRef extends Line {
  final String ref;

  ScriptureRef(
      {Key key,
        this.ref = '',
        String text = '',
        int indent = 0,
        bool bold = false,
        bool center = false,
        bool italic = false,
        double size,
        double leadingSpace = 0,
        double trailingSpace =15,
      })
      : super(
      key: key,
      text: text,
      indent: indent,
      bold: bold,
      center: center,
      italic: italic,
      size: size,
    leadingSpace: leadingSpace,
    trailingSpace: trailingSpace,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>
          [ Text(CompressWhiteSpace(text),
                  style: Theme.of(context).textTheme.bodyText2.merge(lineStyle().copyWith(color: Colors.black87)),
            )
          , Text("$ref".titleCase,
            style: Theme.of(context).textTheme.caption.merge(lineStyle()).apply(
            fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.right,)
          ]
      ),
    );
  }
}

