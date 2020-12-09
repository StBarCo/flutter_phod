part of '../parts.dart';

class PhrasedParagraph extends StatelessWidget{
  final List<Widget> content;
  PhrasedParagraph( this.content, {Key key,}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(top: 5.0, bottom: 15),
        child: Column(children: content,));
  }
}