import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/cart/bloc/cart_cubit.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';

class PaymentCard extends StatelessWidget {
  PaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical:10, horizontal: 20,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border:
        Border.all(color: AppColors.mainColor.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                ' Total price: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                BlocProvider.of<CartCubit>(context).totalPrice.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 1.0),
                  child: Text(
                    ' EGP ',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'PAYMENT',
            onPressed: () {

            },
            fontSize:  18,
            fontWeight: FontWeight.bold,
            width: MediaQuery.of(context).size.width * 0.95,
            buttonColor: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}
