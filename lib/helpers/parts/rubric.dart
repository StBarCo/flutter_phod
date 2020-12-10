part of '../parts.dart';

class Rubric extends Line {
  Rubric(
      {Key key,
        String text = '',
        int indent = 0,
        bool bold = false,
        bool center = false,
        bool italic = false,
        double size,
        double leadingSpace = 10,
        double trailingSpace =0,
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
        alignment: align(),
        margin: EdgeInsets.only(left: inset(), top: leadingSpace, bottom: trailingSpace),
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