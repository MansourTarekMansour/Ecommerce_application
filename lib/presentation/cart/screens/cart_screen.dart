import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/cart/bloc/cart_cubit.dart';
import 'package:man_shop_app/presentation/cart/widgets/cart_products.dart';
import 'package:man_shop_app/shared/components/smart_refresh.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context)..onRefresh();
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          bottom: false,
          child: Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
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
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'Cart',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            body: state is CartLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.blue,
                    ),
                  )
                : SmartRefresh(
                    topHeight: 0,
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
                        padding: const EdgeInsets.only(top: 20, bottom: 70.0),
                        child: Stack(
                          children: [
                            CartProductsWidget(),
                          ],
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
