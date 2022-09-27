import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor: AppColors.mainColor,
    appBarTheme: const AppBarTheme(
      //systemOverlayStyle: SystemUiOverlayStyle.light,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    )
  );
}