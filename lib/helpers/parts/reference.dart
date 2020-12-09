part of '../parts.dart';

class Reference extends Line {
  Reference(
      {Key key,
        String text = '',
        int indent = 0,
        bool bold = false,
        bool center = false,
        bool italic = false,
        double size })
      : super(
      key: key,
      text: text,
      indent: indent,
      bold: bold,
      center: center,
      italic: italic,
      size: size);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(0),
        margin: EdgeInsets.only(top: 0.0, bottom: 5, left: inset()),
        child: Text(
            CompressWhiteSpace(text),
            textAlign: TextAlign.right,
            style: Theme
                .of(context)
                .textTheme
                .caption
                .merge(lineStyle())
                .merge(TextStyle(
              // fontSize: 14.0,
              // color: Colors.red[800].withAlpha(130),
              fontStyle: FontStyle.italic,
            )
            ))
    );
  }

}
