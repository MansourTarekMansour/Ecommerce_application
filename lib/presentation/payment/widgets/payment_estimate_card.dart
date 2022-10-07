import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/payment/bloc/payment_cubit.dart';

class PaymentEstimateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        final paymentCubit = BlocProvider.of<PaymentCubit>(context);
        return Column(
          children: [
            Container(
              width: double.infinity,
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
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Do you want to use discount points?',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            paymentCubit.changeDiscountPoints(false);
                            paymentCubit.setEstimateData();
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: paymentCubit.usePoints == false
                                  ? Colors.grey.withOpacity(0.5)
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              border: Border.all(
                                  color: AppColors.mainColor.withOpacity(0.2)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'No',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            paymentCubit.changeDiscountPoints(true);
                            paymentCubit.setEstimateData();
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: paymentCubit.usePoints == true
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              border: Border.all(
                                  color: AppColors.mainColor.withOpacity(0.2)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
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
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Do you want to use promo code?',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            paymentCubit.changePromoCode(false);
                            paymentCubit.setEstimateData();
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: paymentCubit.usePromoCode == false
                                  ? Colors.grey.withOpacity(0.5)
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              border: Border.all(
                                  color: AppColors.mainColor.withOpacity(0.2)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'No',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            paymentCubit.changePromoCode(true);
                            if(paymentCubit.promoCodeValidate) {
                              paymentCubit.setEstimateData();
                            }
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: paymentCubit.usePromoCode == true
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              border: Border.all(
                                  color: AppColors.mainColor.withOpacity(0.2)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (paymentCubit.usePromoCode)
                    Container(
                      width: 280,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF2F3F2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextField(
                                    controller:
                                        paymentCubit.promoCodeController,
                                    onChanged: (value) {
                                      log(value.toString());
                                      paymentCubit
                                          .checkPromoCodeValidate(value);
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter promo code',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if(state is PaymentPromoCodeLoadingState)
                                const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child:  CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.blue,
                                  ),
                                )
                              else if (paymentCubit.promoCodeController.text.isEmpty)
                                const SizedBox()
                              else if (paymentCubit.promoCodeValidate == false)
                                SvgPicture.asset(
                                  'assets/icons/cancel.svg',
                                  fit: BoxFit.fitWidth,
                                  width: 20,
                                  color: Colors.red,
                                )
                              else
                                SvgPicture.asset(
                                  'assets/icons/payment_choose.svg',
                                  fit: BoxFit.fitWidth,
                                  width: 20,
                                  color: Colors.green,
                                ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
