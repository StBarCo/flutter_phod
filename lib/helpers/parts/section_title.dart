part of '../parts.dart';

class SectionTitle extends Line {
  final String ref;

  SectionTitle(
      {Key key,
      this.ref = '',
      String text = '',
      int indent = 0,
      bool bold = false,
      bool center = false,
      bool italic = false,
      double size,
        double  leadingSpace = 30,
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
        child: Text(CompressWhiteSpace(text).titleCase,
            style: Theme.of(context)
                .textTheme
                .headline4
                .merge(lineStyle().copyWith(color: Theme.of(context).primaryColorDark))
        ));
  }
}
