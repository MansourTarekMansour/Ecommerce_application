import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/cart/bloc/cart_cubit.dart';
import 'package:man_shop_app/shared/components/products_widget.dart';
import 'package:man_shop_app/shared/components/smart_refresh.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context)..getCartData();

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: state is CartLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.blue,
                    ),
                  )
                : SmartRefresh(
                    footerEnabled: true,
                    listLength: cartCubit.cartModel.cartItems.length,
                    controller: cartCubit.refreshController,
                    onRefresh: () async {
                      await cartCubit.onRefresh.call();
                    },
                    idleIconColor: AppColors.mainColor,
                    waterDropColor: Colors.white,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70.0),
                        child: ProductsWidget(
                          products: cartCubit.products,
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
