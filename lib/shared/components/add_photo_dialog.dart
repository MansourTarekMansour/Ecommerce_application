import 'package:flutter/material.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/shared/components/alert_dialog_class.dart';
import 'package:man_shop_app/shared/components/divider_class.dart';
import 'package:man_shop_app/shared/components/text_class.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AddPhotoDialog extends StatelessWidget {
  final VoidFutureCallBack? onPressedGallery;
  final VoidFutureCallBack? onPressedCamera;

  AddPhotoDialog({ this.onPressedGallery,  this.onPressedCamera, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialogClass(
      isDoneIcon: false,
      height: 200.0,
      widget:  TextClass(
        text: 'CHOOSE',
        fontSize: 18,
        textColor: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      bottomWidget: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DividerClass(thickness: 1, color: AppColors.mainColor),
            ListTile(
              leading: const Icon(
                Icons.add_a_photo_outlined,
              ),
              title: TextClass(
                text: 'Camera',
                textAlign: TextAlign.start,
                fontSize: 15,
                textColor: Colors.grey,
              ),
              onTap: onPressedCamera,
            ),
            const Divider(
              height: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.add_photo_alternate_outlined,
              ),
              title: TextClass(
                text: 'From Gallery',
                textAlign: TextAlign.start,
                fontSize: 15,
                textColor: Colors.grey,
              ),
              onTap: onPressedGallery,
            ),
          ],
        ),
      ),
    );
  }
}
