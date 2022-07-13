import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/product_details/bloc/product_details_cubit.dart';
import 'package:man_shop_app/presentation/product_details/widgets/product_details_arrow.dart';
import 'package:shimmer/shimmer.dart';

class PhotoSlider extends StatelessWidget {
  PhotoSlider(this.images);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    return SafeArea(
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (BuildContext context, state) => Container(
          height: productDetailsCubit.imgSliderHeight,
          width: MediaQuery.of(context).size.width -
              (319 - productDetailsCubit.imgSliderHeight),
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: PageView.builder(
                  controller: productDetailsCubit.sliderController,
                  itemCount: images.length,
                  onPageChanged: (index) =>
                      productDetailsCubit.onImageChange(index),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: CachedNetworkImage(
                      imageUrl: images[index].toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[100]!,
                        highlightColor: Colors.grey[200]!,
                        child: SvgPicture.asset(
                            'assets/images/on_boarding_cart.svg'),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    //child: Image.network(images[index],fit: BoxFit.cover,),
                  ),
                ),
              ),
              if (productDetailsCubit.currentImgIndex != images.length - 1)
                Positioned(
                  right: 9,
                  child: ProductDetailsArrow(
                    icon:
                        'assets/images/product_details_images_right_arrow.svg',
                    onTap: () {
                      productDetailsCubit.changeImgNext();
                      productDetailsCubit.sliderController.jumpToPage(
                        productDetailsCubit.currentImgIndex,
                      );
                    },
                    quarterTurns: 0,
                  ),
                )
              else
                const SizedBox(),
              if (productDetailsCubit.currentImgIndex == 0)
                const SizedBox()
              else
                Positioned(
                  left: 9,
                  child: ProductDetailsArrow(
                    icon: 'assets/images/product_details_images_left_arrow.svg',
                    onTap: () {
                      productDetailsCubit.changeImgBack();
                      productDetailsCubit.sliderController.jumpToPage(
                        productDetailsCubit.currentImgIndex,
                      );
                    },
                    quarterTurns: 2,
                  ),
                ),
              Positioned(
                bottom: 5,
                child: Container(
                  height: 55.0,
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 5.0, left: 5.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => InkWell(
                      onTap: () {
                        productDetailsCubit.onImageChange(index);
                      },
                      child: (index == productDetailsCubit.currentImgIndex)
                          ? Container(
                              width: 50.0,
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                border: Border.all(
                                    color: AppColors.mainColor, width: 2),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: images[index].toString(),
                                fit: BoxFit.contain,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[100]!,
                                  highlightColor: Colors.grey[300]!,
                                  child: Image.asset(
                                    'assets/images/logo.png',
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 40.0,
                              width: 40.0,
                              child: CachedNetworkImage(
                                imageUrl: images[index].toString(),
                                fit: BoxFit.fitWidth,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[100]!,
                                  highlightColor: Colors.grey[300]!,
                                  child: Image.asset(
                                    'assets/images/logo.png',
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                ),
                              ),
                            ),
                    ),
                    separatorBuilder: (_, index) => const SizedBox(width: 15),
                    itemCount: images.length,
                  ),
                ),
              ),
              if (productDetailsCubit.imgSliderHeight <=
                  productDetailsCubit.imgSliderConstHeight - 10)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1 -
                                  (productDetailsCubit.imgSliderHeight /
                                      productDetailsCubit
                                          .imgSliderConstHeight) >=
                              0.4
                          ? min(
                              1 -
                                  (productDetailsCubit.imgSliderHeight /
                                      productDetailsCubit
                                          .imgSliderConstHeight) +
                                  0.4,
                              1)
                          : 1 -
                              (productDetailsCubit.imgSliderHeight /
                                  productDetailsCubit.imgSliderConstHeight)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
