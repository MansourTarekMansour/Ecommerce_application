import 'package:flutter/material.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/shared/components/text_class.dart';


class ProfileTextField extends StatelessWidget {
  final String text;
  final IconData icon;

  const ProfileTextField({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
            color: AppColors.mainColor.withOpacity(0.2)),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          //reverse: true,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  iconSize: size.width >= 500 ? 25 : size.width / 20,
                  icon: Icon(icon),
                  onPressed: null,
                  color: Colors.black,
                ),
                TextClass(
                  text: text,
                  fontSize: size.width >= 500 ? 18 : size.width / 22,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}