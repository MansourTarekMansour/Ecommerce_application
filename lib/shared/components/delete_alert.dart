import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeleteAlert extends StatelessWidget {
  late final String? imgName;
  final String? title;
  final String? content;
  final double? scale;
  late final String? svgPath;
  final VoidCallback onPressed;

  DeleteAlert.png({
    this.title,
    required this.imgName,
    this.content,
    this.scale,
    required this.onPressed,
  }) {
    svgPath = null;
  }

  DeleteAlert.svg({
    this.title,
    required this.svgPath,
    this.content,
    this.scale,
    required this.onPressed,
  }) {
    imgName = null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      actions: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 12,
              ),
              svgPath != null
                  ? SvgPicture.asset(
                      svgPath!,
                      width: 40,
                      height: 40,
                      color: Colors.red,
                    )
                  : Image.asset(
                      imgName!.contains('/')
                          ? imgName!
                          : 'assets/images/icons/$imgName.png',
                      scale: scale ?? 4,
                    ),
              const SizedBox(
                height: 12,
              ),
              Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                content!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton(
                context,
                bgColor: Colors.grey,
                title: 'cancel',
                onTap: () {},
              ),
              _buildButton(
                context,
                bgColor: Colors.red,
                title: 'Yes',
                onTap: onPressed,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  SizedBox _buildButton(
    BuildContext context, {
    Color? bgColor,
    required String title,
    Function()? onTap,
  }) =>
      SizedBox(
        width: 120,
        height: 35,
        child: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
            onTap?.call();
          },
          elevation: 0.0,
          highlightElevation: 00.0,
          color: bgColor,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );
}
