
import 'package:flutter/material.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';


class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  final String text;
  final EdgeInsetsGeometry margin;
  final FontWeight fontWeight;

  const CustomButton({Key? key,
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
    this.height = 50,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 20,
    this.buttonColor =  const Color.fromRGBO(64, 123, 255, 1),
    this.textColor=  Colors.white,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: AppColors.mainColor.withOpacity(0.2),
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        height: height,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: 'Tajawal',
          ),
        ),
      ),
    );
  }
}
