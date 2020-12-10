part of '../parts.dart';

class Line extends StatelessWidget {
  final String text;
  final int indent;
  final bool bold;

  // final bool smallcaps;
  final bool center;
  final bool italic;
  final double size;
  final double leadingSpace;
  final double trailingSpace;

  Line(
      {Key key,
        this.text = '',
        this.indent = 0,
        this.bold = false
        // , this.smallcaps = false // can't find a way to do this
        ,
        this.center = false,
        this.italic = false,
        this.size,
        this.leadingSpace = 0,
        this.trailingSpace = 5,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: align(),
        margin: EdgeInsets.only(left: inset(), top: leadingSpace, bottom: trailingSpace),
        child: Text(
          CompressWhiteSpace(text),
          style: Theme.of(context).textTheme.bodyText2.merge(lineStyle())),
        );
  }

  TextStyle lineStyle() {
    TextStyle t = TextStyle();

    if(bold){
      t = t.copyWith(fontWeight: FontWeight.bold);
    }
    if(italic){
      t = t.copyWith(fontStyle: FontStyle.italic);
    }
    if(size != null){
      t = t.copyWith(fontSize: size);
    }
    return t;
  }

  double inset() {
    return 30.0*indent;
  }

  Alignment align() {
    return center ? Alignment.center : Alignment.centerLeft;
  }
}