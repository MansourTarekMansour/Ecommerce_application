import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';

class ProductDetailsArrow extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  final int quarterTurns;

  const ProductDetailsArrow({required this.icon, required this.onTap, required this.quarterTurns});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        width: 50,
        child: Center(
          child: Container(
            width: 18,
            height: 45,
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: SvgPicture.asset(
              icon,
              height: 28.0,
              color: AppColors.mainColor,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
