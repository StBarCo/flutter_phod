part of '../parts.dart';

class SectionTitle extends Line {
  final String ref;
  final double leadingSpace;

  SectionTitle(
      {Key key,
      this.ref = '',
      this.leadingSpace = 30,
      String text = '',
      int indent = 0,
      bool bold = false,
      bool center = false,
      bool italic = false,
      double size})
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
        margin: EdgeInsets.only(top: leadingSpace, bottom: 0, left: inset()),
        child: Text(CompressWhiteSpace(text).titleCase,
            style: Theme.of(context)
                .textTheme
                .headline4
                .merge(lineStyle().copyWith(color: Theme.of(context).primaryColorDark))
        ));
  }
}
