part of '../parts.dart';

/// Paragraph is an extension of Line with vertical margins.
class Paragraph extends Line {
  Paragraph(
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
        margin: EdgeInsets.only(top: 5.0, bottom: 15, left: inset()),
        child: Text(CompressWhiteSpace(text), style: Theme.of(context).textTheme.bodyText2.merge(lineStyle()))
    );
  }
}