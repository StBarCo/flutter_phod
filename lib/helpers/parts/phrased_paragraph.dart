part of '../parts.dart';

class PhrasedParagraph extends StatelessWidget{
  final List<Widget> content;
  final int indent;
  final double leadingSpace;
  final double trailingSpace;

  PhrasedParagraph( {this.content, this.indent = 0, this.leadingSpace = 5.0, this.trailingSpace = 15.0, Key key,}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(left: indent * 30.0, top: leadingSpace, bottom: trailingSpace),
        child: Column(children: content,));
  }
}