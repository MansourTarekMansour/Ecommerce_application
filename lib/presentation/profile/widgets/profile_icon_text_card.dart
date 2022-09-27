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
    this.iconWidth = 50,
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
            width: double.infinity,
            height: 60,
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
        Padding(
          padding: const EdgeInsets.only(top: 5.5, left: 35),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.fitWidth,
              width: iconWidth,
            ),
          ),
        ),
        Positioned(
          left: 120,
          top: 9,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 160,
                child: Text(
                  hint,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
