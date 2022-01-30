
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Color buttonColor;
  final VoidCallback onPressed;
  final String text;
  final EdgeInsetsGeometry margin;
  final FontWeight fontWeight;

  CustomButton({
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
    this.height = 50,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 20,
    this.buttonColor =  const Color.fromRGBO(64, 123, 255, 1),
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(15)),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        height: height,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: 'Tajawal',
          ),
        ),
      ),
    );
  }
}
