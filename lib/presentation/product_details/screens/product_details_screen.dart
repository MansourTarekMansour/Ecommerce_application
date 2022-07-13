import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/presentation/product_details/bloc/product_details_cubit.dart';
import 'package:man_shop_app/presentation/product_details/widgets/Product_details_price_bar.dart';
import 'package:man_shop_app/presentation/product_details/widgets/photo_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments! as Products;
    log(product.images.toString());
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final productDetailsCubit =
            BlocProvider.of<ProductDetailsCubit>(context);
        return Scaffold(
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is UserScrollNotification) {
                if (scrollNotification.metrics.axisDirection == AxisDirection.down || scrollNotification.metrics.axisDirection == AxisDirection.up){
                  log(scrollNotification.metrics.pixels.toString());
                  productDetailsCubit.changeImgSliderVisibility(
                      scrollNotification.metrics.pixels.toDouble());
                }
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
                      child: ProductDetailsPriceBar(),
                    ),
                  ),
                  Visibility(
                    //visible: productDetailsCubit.imgSliderVisibility,
                    child: Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: PhotoSlider(product.images),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
