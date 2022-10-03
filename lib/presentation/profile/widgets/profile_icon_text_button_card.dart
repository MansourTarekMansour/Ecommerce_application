import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';

class ProfileIconTextButtonCard extends StatelessWidget {
  ProfileIconTextButtonCard({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.hint,
    this.iconColor = Colors.grey,
    required this.onPress,
  }) : super(key: key);
  final String text;
  final String hint;
  final String iconPath;
  Color iconColor;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                color: AppColors.mainColor.withOpacity(0.2),
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 15,
          child: SvgPicture.asset(
            iconPath,
            fit: BoxFit.fitWidth,
            width: 40,
            color: iconColor,
          ),
        ),
        Positioned(
          left: 70,
          top: 17.5,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 1),
              Text(
                hint,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Positioned(
          right: 15,
          top: 22.5,
          child: SvgPicture.asset(
            'assets/images/back_arrow.svg',
            color: Colors.grey,
            fit: BoxFit.fitWidth,
            height: 25,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: onPress,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
