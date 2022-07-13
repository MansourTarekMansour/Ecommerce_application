import 'package:flutter/material.dart';
import 'package:man_shop_app/presentation/product_details/widgets/product_details_description.dart';

class ProductDetailsItems extends StatelessWidget {
  const ProductDetailsItems({Key? key}) : super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
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
            ),
            const ProductDetailsDescription(),
          ],
        ),
      ),
    );
  }
}
