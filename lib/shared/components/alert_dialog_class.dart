import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'divider_class.dart';

class AlertDialogClass extends StatelessWidget {
  final Widget? content;
  final Color backgroundColor;
  final double height;
  final Widget widget;
  final Widget bottomWidget;
  final bool isDoneIcon;

  AlertDialogClass(
      {this.content,
      this.backgroundColor = Colors.transparent,
      required this.height,
      required this.bottomWidget,
      required this.widget,
      this.isDoneIcon = true});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      insetPadding: EdgeInsets.symmetric(vertical: 50),
      content: Container(
        width: 300,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            SizedBox(height: 25),
            widget,
            if (isDoneIcon)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset('assets/icons/done.svg'),
              ),
            if (isDoneIcon)
              DividerClass(
                  color: Color.fromRGBO(200, 218, 245, 1), thickness: 2.0),
            Expanded(
                child: Container(width: double.infinity, child: bottomWidget))
          ],
        ),
      ),
    );
  }
}
