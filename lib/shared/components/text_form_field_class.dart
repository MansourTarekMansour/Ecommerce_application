import 'package:flutter/material.dart';

class TextFormFieldClass extends StatelessWidget {
  //required controller
  final TextEditingController controller;

  //validator
  FormFieldValidator<String>? validator;

  //Hint text
  String? textHint;

  // //Hint color (initial color black)
  Color hintColor;
  TextStyle? hintStyle;
   TextAlign textAlign;
  //Text color (initial color black)
  Color textColor;

  //background color (initial color white)
  Color backgroundColor;

  // prefix Icon
  Widget? prefix;

  //Rounded Rectangle Border (initial 15.0)
  double roundedRectangleBorder;

  //obscure Text
  bool obscureText;

  //Widget suffix Icon
  Widget? suffixIcon;

  //Text Input Type (keyboard Type)
  TextInputType? keyboardType;

  EdgeInsetsGeometry contentPadding;

  //label
  String? label;
  InputDecoration? decoration;
  TextStyle? textStyle;
  StrutStyle? structStyle;
  bool autofocus;
  int? maxLines;
  double? fontSize;
  TextOverflow? overflow;
  double? height;
  TextFormFieldClass({
    required this.controller,
    this.validator,
    this.textHint,
    this.hintStyle,
    this.hintColor = Colors.black38,
    this.textAlign=TextAlign.start,
    this.textColor = const Color.fromRGBO(4, 15, 15, 1),
    this.backgroundColor = Colors.white,
    this.prefix,
    this.roundedRectangleBorder = 15.0,
    this.obscureText = false,
    this.autofocus=false,
    this.suffixIcon,
    this.keyboardType,
    this.label,
    this.decoration,
    this.textStyle,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    this.maxLines=1,
    this.fontSize,
    this.overflow,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      textAlign: textAlign,
      autofocus: autofocus,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        overflow: overflow,
        fontFamily: 'Tajawal',
        height: height,
      ),
      strutStyle: structStyle,
      decoration: InputDecoration(
        hintText: textHint,
        filled: true,
        fillColor: backgroundColor,
        labelText: label,
        contentPadding: contentPadding,
        helperStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedRectangleBorder),
        ),
        prefixIcon: prefix,
        hintStyle: hintStyle,
        // icon: icon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      maxLines:maxLines,
    );
  }
}
