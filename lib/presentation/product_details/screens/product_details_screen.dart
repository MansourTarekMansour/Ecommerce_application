import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/presentation/home/bloc/home_cubit.dart';
import 'package:man_shop_app/presentation/product_details/bloc/product_details_cubit.dart';
import 'package:man_shop_app/presentation/product_details/widgets/Product_details_items.dart';
import 'package:man_shop_app/presentation/product_details/widgets/add_to_cart_button.dart';
import 'package:man_shop_app/presentation/product_details/widgets/photo_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments! as List;
    final homeProducts =
        BlocProvider.of<HomeCubit>(context).homeModel.data.products;
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final productDetailsCubit =
            BlocProvider.of<ProductDetailsCubit>(context);
        productDetailsCubit.products = arg[0] as Products;
        productDetailsCubit.productId = arg[1] as int;
        if (productDetailsCubit.products.images.isEmpty) {
          productDetailsCubit.products.images
              .add(productDetailsCubit.products.image);
        }
        for (int i = 0; i < homeProducts.length; i++) {
          if (homeProducts[i].id == productDetailsCubit.productId) {
            productDetailsCubit.productIndex = i;
            log(productDetailsCubit.productIndex.toString());
            break;
          }
        }
        return Scaffold(
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification.metrics.axisDirection ==
                      AxisDirection.down ||
                  scrollNotification.metrics.axisDirection ==
                      AxisDirection.up) {
                productDetailsCubit.changeImgSliderVisibility(
                    scrollNotification.metrics.pixels.toDouble());
              }
              return false;
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Stack(
                children: [
                  const SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 370.0),
                      child: ProductDetailsItems(),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: PhotoSlider(productDetailsCubit.products.images),
                  ),
                  if (productDetailsCubit.imgSliderHeight <= 100)
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  Positioned(
                    top: 50,
                    left: 23,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200]?.withOpacity(0.7),
                      ),
                      // ignore: deprecated_member_use
                      child: MaterialButton(
                        elevation: 0.0,
                        highlightElevation: 0.0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        color: Colors.transparent,
                        onPressed: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          'assets/images/left_arrow.svg',
                          color: AppColors.mainColor,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AddToCartButton(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
