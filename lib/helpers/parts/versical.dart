part of '../parts.dart';

class Versical extends Line {
  final String speaker;

  Versical(
      {Key key,
        this.speaker ='',
        String text = '',
        int indent = 0,
        bool bold = false,
        bool center = false,
        bool italic = false,
        double size,
        double leadingSpace = 0,
        double trailingSpace =5,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: inset(), top: leadingSpace, bottom: trailingSpace),
            width: 80.0,
            alignment: Alignment.bottomLeft,
            child: Text(
              speaker,
              style: Theme.of(context).textTheme.caption.merge(TextStyle(
                  fontStyle: FontStyle.italic,
              )),
            )),
        Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2.merge(lineStyle()),
              softWrap: true,
            )),
      ],
    );
  }
}
