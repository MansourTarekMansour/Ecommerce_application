import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/shared/styles/color.dart';

class ProductsWidget extends StatelessWidget {
  final List<Products> products;

  ProductsWidget({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: SizedBox(
        width: double.infinity,
        child: MasonryGridView.count(
          itemCount: products.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          itemBuilder: (context, index) {
            return Container(
              height: 220,
              width: 173,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: iconColor.withOpacity(0.2)),
              ),
              child: SizedBox(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          products[index].image,
                          fit: BoxFit.contain,
                          height: 150,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 135,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          products[index].name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 180,
                      right: 10,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.grey.withOpacity(0.5),
                        size: 30,
                      ),
                    ),
                    Positioned(
                      top: products[index].oldPrice > products[index].price
                          ? 165
                          : 172.5,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EGP ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: iconColor,
                              ),
                            ),
                            Text(
                              products[index].price.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: iconColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (products[index].oldPrice > products[index].price)
                      Positioned(
                        top: 180,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '         ',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: iconColor,
                                ),
                              ),
                              Stack(
                                children: [
                                  Positioned(
                                    top: 7.3,
                                    child: Container(
                                      height: 1.5,
                                      width: products[index]
                                              .oldPrice
                                              .toString()
                                              .length *
                                          10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    products[index].oldPrice.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
        // GridView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemCount: 10,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 15.0,
        //     mainAxisSpacing: 15.0,
        //     childAspectRatio: 0.75,
        //   ),
        //   itemBuilder: (context, index) {
        //     return Container(
        //       height: 280,
        //       //width: 170,
        //       color: iconColor,
        //       child: Stack(
        //         children: [
        //           Positioned(
        //             top: 0,
        //             left: 0,
        //             right: 0,
        //             child: Image.network(
        //               'https://images.unsplash.com/photo-1583267746897-2cf415887172?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXV0b21vYmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
        //               fit: BoxFit.cover,
        //               height: 100,
        //             ),
        //           )
        //         ],
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
