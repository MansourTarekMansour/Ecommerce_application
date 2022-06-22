import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/products/bloc/products_cubit.dart';
import 'package:man_shop_app/presentation/products/bloc/products_states.dart';
import 'package:man_shop_app/shared/styles/color.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsCubit = BlocProvider.of<ProductsCubit>(context);
    return BlocBuilder<ProductsCubit, ProductsStates>(
      builder: (context, state) {
        return Stack(
          children: [
            CarouselSlider.builder(
              itemCount: productsCubit.homeModel.data.banners.length,
              itemBuilder: (context, itemIndex, _) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius:  BorderRadius.circular(15),
                      child: Image.network(
                        productsCubit.homeModel.data.banners[itemIndex].image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 150,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, _) {
                  productsCubit.changeBannerIndex(index);
                },
              ),
            ),
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 10,
                child: Center(
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return productsCubit.indicatorIndex == index
                          ? Container(
                              width: 20.0,
                              height: 2.5,
                              decoration: BoxDecoration(
                                color: iconColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                            )
                          : Container(
                              width: 10.0,
                              height: 2.5,
                              decoration: const BoxDecoration(
                                color: Color(0XFFF4CCCC),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            );
                    },
                    separatorBuilder: (_, index) => const SizedBox(width: 5),
                    itemCount: productsCubit.homeModel.data.banners.length,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
