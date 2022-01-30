import 'package:flutter/material.dart';

class TextClass extends StatelessWidget {
  // required text
  late final String text;

  //initial font size 25
  late double fontSize;

  //initial TextAlign center
  late TextAlign textAlign;

  //initial FontWeight normal
  late FontWeight fontWeight;

  //initial Text color black
  late Color textColor;

  TextOverflow? overflow;
  int? maxLines;

  //initial Text backgroundColor white
  // Color backgroundColor = Colors.white,

  TextClass({
    required this.text,
    this.fontSize = 18,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.black,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        fontFamily: 'Tajawal',
      ),
      maxLines: maxLines,
    );
  }
}
