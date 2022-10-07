import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/address/bloc/address_cubit.dart';
import 'package:man_shop_app/presentation/cart/bloc/cart_cubit.dart';
import 'package:man_shop_app/presentation/cart/widgets/cart_products.dart';
import 'package:man_shop_app/presentation/cart/widgets/paymen_card.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';
import 'package:man_shop_app/shared/components/custom_loading_indicator.dart';
import 'package:man_shop_app/shared/components/smart_refresh.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context)..getCartData();
    BlocProvider.of<AddressCubit>(context).getAddressData();
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
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
                title: const Center(
                  child: Text(
                    'Cart',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                actions: const[SizedBox(width: 50)],
              ),
              body: state is CartLoadingState
                  ? const CustomLoadingIndicator()
                  : state is CartErrorState
                      ? Center(
                          child: Text(state.error),
                        )
                      : cartCubit.products.isEmpty
                          ? Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 50.0),
                                    child: SvgPicture.asset(
                                      "assets/images/empty_cart_2.svg",
                                      width: 800,
                                      height: 800,
                                      //color: AppColors.mainColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'EMPTY CART',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          'back to',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.all(10.0).copyWith(
                                            top: 5,
                                          ),
                                          child: CustomButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            text: 'HOME',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.95,
                                            buttonColor: AppColors.mainColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Stack(
                              children: [
                                SmartRefresh(
                                  topHeight: 0,
                                  footerEnabled: true,
                                  listLength:
                                      cartCubit.cartModel.cartItems.length,
                                  controller: cartCubit.refreshController,
                                  onRefresh: () async {
                                    await cartCubit.onRefresh.call();
                                  },
                                  idleIconColor: AppColors.mainColor,
                                  waterDropColor: Colors.white,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 70.0),
                                      child: CartProductsWidget(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: PaymentCard(),
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
