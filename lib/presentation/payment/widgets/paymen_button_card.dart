import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/payment/bloc/payment_cubit.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';

class PaymentButtonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);
    return BlocBuilder<PaymentCubit, PaymentState>(builder: (context, state) {
      dynamic vat = (paymentCubit.estimateOrderModel.subTotal -
          paymentCubit.estimateOrderModel.total);
      return Container(
        height: paymentCubit.moreDetails ? 172 : 120.0,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: AppColors.mainColor.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            if (paymentCubit.moreDetails) ...[
              Row(
                children: [
                  const Text(
                    ' Cost: ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    paymentCubit.estimateOrderModel.subTotal.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
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
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    ' Vat: ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    vat is int
                        ? vat.toString()
                        : (vat as double).round().toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
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
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(width: 10),
            ],
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' Price: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  paymentCubit.estimateOrderModel.total is int
                      ? paymentCubit.estimateOrderModel.total.toString()
                      : (paymentCubit.estimateOrderModel.total as double)
                          .round()
                          .toString(),
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
                const Spacer(),
                GestureDetector(
                  onTap: () => paymentCubit.changeMoreDetailsButton(),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      paymentCubit.moreDetails
                          ? 'Hide details'
                          : 'Show details',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ConditionalBuilder(
              condition: state is! PaymentAddOrderLoadingState,
              builder: (context) => CustomButton(
                text: 'PAYMENT',
                onPressed: () {
                  if (paymentCubit.validate()) {
                    paymentCubit.addOrder();
                  }
                },
                fontSize: 18,
                fontWeight: FontWeight.bold,
                width: MediaQuery.of(context).size.width * 0.95,
                buttonColor:
                    paymentCubit.validate() ? AppColors.mainColor : Colors.grey,
              ),
              fallback: (context) => Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius:
                      const BorderRadiusDirectional.all(Radius.circular(15)),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
