import 'package:flutter/material.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';

class ProductDetailsPriceBar extends StatelessWidget {
  const ProductDetailsPriceBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: SizedBox(
        height: 1000,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 10,
                width: MediaQuery.of(context).size.width * 0.25,
                child: Container(
                  height: 10,
                  decoration:  BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
