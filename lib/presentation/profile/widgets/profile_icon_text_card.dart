import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/profile/bloc/profile_cubit.dart';

class ProfileIconTextCard extends StatelessWidget {
  ProfileIconTextCard({
    Key? key,
    required this.text,
    required this.hint,
    required this.iconPath,
    this.iconWidth = 40,
  }) : super(key: key);
  final String text;
  final String hint;
  final String iconPath;
  double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: (MediaQuery.of(context).size.width / 2) - 25,
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
            width: iconWidth,
          ),
        ),
        Positioned(
          left: 60,
          top: 17.5,
          child: SizedBox(
            width: 100,
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
                  (hint.contains('.') ? hint.replaceRange(hint.indexOf('.'), hint.length, ''): hint),
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
