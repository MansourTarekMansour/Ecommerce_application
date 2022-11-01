import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/home/bloc/home_cubit.dart';
import 'package:man_shop_app/presentation/home/bloc/home_states.dart';
import 'package:man_shop_app/presentation/home/widgets/banner_widget.dart';
import 'package:man_shop_app/presentation/home/widgets/categories_bar.dart';
import 'package:man_shop_app/shared/components/custom_loading_indicator.dart';
import 'package:man_shop_app/shared/components/products_widget.dart';
import 'package:man_shop_app/shared/components/smart_refresh.dart';

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
            child: state is HomeGetDataLoadingState ||
                    state is HomeGatCategoriesLoadingState
                ? const CustomLoadingIndicator()
                : SmartRefresh(
                    topHeight: 70,
                    footerEnabled: false,
                    listLength: homeCubit.homeModel.data.products.length,
                    controller: homeCubit.refreshController,
                    onRefresh: () async {
                      await homeCubit.onRefresh.call();
                    },
                    idleIconColor: AppColors.mainColor,
                    waterDropColor: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 85.0),
                          const BannerWidget(),
                          const SizedBox(height: 30.0),
                          const CategoriesBar(),
                          const SizedBox(height: 30.0),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                            child: Text(
                              'Products',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          ProductsWidget(
                            products: homeCubit.homeModel.data.products,
                          ),
                          const SizedBox(height: 70.0),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
