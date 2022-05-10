import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  Widget? title;
  double? titleSize;
  double width;
  String? hint;
  double? hintSize;
  Color titleColor;
  Color? boxColor;
  double? heightBetweenTitleAndHint;
  Color hintColor;
  Widget? prefixIcon;
  Widget? suffixIcon;
  double? iconSize;
  double? circular;
  double? boxHeight;
  TextInputType? keyboardType;
  double? hintTopHeight;
  double? hintLeftHeight;
  bool obscureText;
  TextEditingController? controller;
  String? Function(String?)? validate;
  void Function(String)? onFieldSubmitted;

  CustomTextField({Key? key,
    this.title,
    this.titleSize,
    this.hint,
    this.hintSize,
    this.titleColor = const Color.fromRGBO(96, 96, 96, 1),
    this.boxColor = Colors.white,
    this.heightBetweenTitleAndHint = 5.0,
    this.boxHeight = 50.0,
    this.hintColor = const Color.fromRGBO(96, 96, 96, 1),
    this.prefixIcon,
    this.iconSize,
    this.circular = 15.0,
    this.keyboardType,
    this.hintLeftHeight = 0,
    this.hintTopHeight = 15,
    this.width = double.infinity,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.validate,
    this.onFieldSubmitted,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: title,
        ),
        SizedBox(height: heightBetweenTitleAndHint),
        Material(
          child: TextFormField(
            onFieldSubmitted: onFieldSubmitted,
            controller: controller,
            validator: validate,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: TextStyle(
              color: hintColor,
            ),
            decoration: InputDecoration(
              fillColor:boxColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(circular!),
              ),
              contentPadding: EdgeInsets.only(top: hintTopHeight!, left: hintLeftHeight!),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hint,
              hintStyle: TextStyle(
                color: hintColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
