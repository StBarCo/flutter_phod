part of '../parts.dart';

class ItemTitle extends Line {
  final String ref;
  final double leadingSpace;

  ItemTitle(
      {Key key,
        this.ref = '',
        this.leadingSpace = 15,
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
        margin: EdgeInsets.only(top: leadingSpace, bottom: 5 , left: inset()),
        child: Text(CompressWhiteSpace(text).titleCase, style: Theme.of(context).textTheme.headline5.merge(lineStyle().copyWith(color: Theme.of(context).primaryColorDark, )))
    );
    /*
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: text,
                  style: TextStyle( fontSize: 20.0)
              ),
              Reference(text: ref)]
            ),
        ),

         */
  }
}