part of '../parts.dart';

class Rubric extends Line {
  Rubric(
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
        alignment: align(),
        margin: EdgeInsets.only(top: 10.0, bottom: 00, left: inset()),
        child: Text(
            CompressWhiteSpace(text),
            style: Theme.of(context).textTheme.caption.merge(lineStyle()).merge(TextStyle(
              // fontSize: 14.0,
              color: Colors.red[800].withAlpha(130),
            )
        ))
    );
  }
}