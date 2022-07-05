import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/features/home/presentation/bloc/home_cubit.dart';
import 'package:man_shop_app/features/home/presentation/bloc/home_states.dart';
import 'package:man_shop_app/features/home/presentation/widgets/banner_widget.dart';
import 'package:man_shop_app/features/home/presentation/widgets/categories_bar.dart';
import 'package:man_shop_app/features/home/presentation/widgets/products_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: state is HomeLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.blue,
                    ),
                  )
                : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 85.0),
                      const BannerWidget(),
                      const SizedBox(height: 30.0),
                      const CategoriesBar(),
                      const SizedBox(height: 30.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0,bottom: 10.0),
                        child: Text(
                          'Products',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      ProductsWidget(products: homeCubit.homeModel.data.products,),
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }
}
