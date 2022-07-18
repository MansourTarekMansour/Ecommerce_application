import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:man_shop_app/config/routes/routes.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/data/models/Favorites/favorites_model.dart';
import 'package:man_shop_app/presentation/favorites/bloc/favorites_cubit.dart';
import 'package:man_shop_app/presentation/home/bloc/home_cubit.dart';

class FavoriteProductsWidget extends StatelessWidget {
  final List<Data> products;

  FavoriteProductsWidget({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
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
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator?.of(context).pushNamed(
                      Routes.productDetailsRoute,
                      arguments: [
                        products[index],
                        index,
                      ],
                    );
                  },
                  child: Container(
                    height: 220,
                    width: 173,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border:
                          Border.all(color: AppColors.mainColor.withOpacity(0.2)),
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
                                products[index].product.image,
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
                                products[index].product.name,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: products[index].product.oldPrice >
                                    products[index].product.price
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
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  Text(
                                    products[index].product.price.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (products[index].product.oldPrice >
                              products[index].product.price)
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
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Positioned(
                                          top: 7.3,
                                          child: Container(
                                            height: 1.5,
                                            width: products[index]
                                                    .product
                                                    .oldPrice
                                                    .toString()
                                                    .length *
                                                10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          products[index]
                                              .product
                                              .oldPrice
                                              .toString(),
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
                  ),
                ),
                if(favoritesCubit.notFavorite[index])
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Container(
                    height: 220,
                    width: 173,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeCubit>(context)
                          .isFavorites(id: products[index].product.id);
                      favoritesCubit.isFavorite(
                          index
                      );
                    },
                    child: Icon(
                      Icons.favorite,
                      color: !favoritesCubit.notFavorite[index]? Colors.red : Colors.grey.withOpacity(0.5),
                      size: 30,
                    ),
                  ),
                ),
              ],
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
