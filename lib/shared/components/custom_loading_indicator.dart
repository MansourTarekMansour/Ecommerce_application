import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            AppColors.mainColor,
            //Colors.grey,
          ],
          strokeWidth: 10,
        ),
      ),
    );
  }
}
