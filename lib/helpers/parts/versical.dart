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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(right: inset(), bottom: 5),
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
