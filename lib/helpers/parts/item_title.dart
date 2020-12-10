part of '../parts.dart';

class ItemTitle extends Line {
  final String ref;


  ItemTitle(
      {Key key,
        this.ref = '',
        String text = '',
        int indent = 0,
        bool bold = false,
        bool center = false,
        bool italic = false,
        double size,
        double leadingSpace = 15,
        double trailingSpace = 5,
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