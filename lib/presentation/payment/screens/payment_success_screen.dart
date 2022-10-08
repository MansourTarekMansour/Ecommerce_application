import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/cart/bloc/cart_cubit.dart';
import 'package:man_shop_app/presentation/home/bloc/home_cubit.dart';
import 'package:man_shop_app/presentation/payment/bloc/payment_cubit.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: SvgPicture.asset(
                "assets/images/order_successful.svg",
                width: 250,
                height: 250,
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
                    'ORDER SUCCESSFUL',
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
                      onPressed: () {
                        BlocProvider.of<HomeCubit>(context).onRefresh();
                        BlocProvider.of<CartCubit>(context).onRefresh();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
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
      ),
    );
  }
}
