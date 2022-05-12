import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/products/bloc/cubit.dart';
import 'package:man_shop_app/presentation/products/bloc/states.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);
  final PageController smoothPageIndicatorController = PageController();

  //final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final productsCubit = BlocProvider.of<ProductsCubit>(context);
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: state is ProductsLoadingState
                ? const Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.blue,
                    ),
                )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF9A84D),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              //color: Color(0xFFF9A84D),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: null,
                            reverse: true,
                            itemCount:
                                productsCubit.homeModel.data.banners.length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                productsCubit
                                    .homeModel.data.banners[index].image,
                                fit: BoxFit.fitWidth,
                              );
                            },
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
