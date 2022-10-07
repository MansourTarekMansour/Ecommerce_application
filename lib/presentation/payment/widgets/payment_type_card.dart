import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/payment/bloc/payment_cubit.dart';

class PaymentTypeCard extends StatelessWidget {
  PaymentTypeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);
    return Container(
      width: double.infinity,
      //height: 182,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: AppColors.mainColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Select a payment method',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => paymentCubit.setPaymentType(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: paymentCubit.paymentType == 1
                          ? Colors.green.withOpacity(0.2)
                          : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      border: Border.all(
                          color: AppColors.mainColor.withOpacity(0.2)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/cash_payment.svg',
                            fit: BoxFit.fitWidth,
                            width: 40,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Cash',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'payment when receiving',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SvgPicture.asset(
                              'assets/icons/payment_choose.svg',
                              fit: BoxFit.fitWidth,
                              width: 20,
                              color: paymentCubit.paymentType == 1
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => paymentCubit.setPaymentType(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: paymentCubit.paymentType == 2
                          ? Colors.green.withOpacity(0.1)
                          : Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      border: Border.all(
                          color: AppColors.mainColor.withOpacity(0.2)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/credit.svg',
                            fit: BoxFit.fitWidth,
                            width: 40,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Credit',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'payment by credit card',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SvgPicture.asset(
                              'assets/icons/payment_choose.svg',
                              fit: BoxFit.fitWidth,
                              width: 20,
                              color: paymentCubit.paymentType == 2
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
