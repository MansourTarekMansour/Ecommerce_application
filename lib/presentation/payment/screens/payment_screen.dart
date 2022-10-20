import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/payment/bloc/payment_cubit.dart';
import 'package:man_shop_app/presentation/payment/screens/payment_success_screen.dart';
import 'package:man_shop_app/presentation/payment/widgets/paymen_button_card.dart';
import 'package:man_shop_app/presentation/payment/widgets/payment_addresses_card.dart';
import 'package:man_shop_app/presentation/payment/widgets/payment_estimate_card.dart';
import 'package:man_shop_app/presentation/payment/widgets/payment_type_card.dart';
import 'package:man_shop_app/shared/components/custom_loading_indicator.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PaymentCubit>(context).getEstimate();
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if(state is PaymentAddOrderSuccessState){
          BlocProvider.of<PaymentCubit>(context).clearData();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const PaymentSuccessScreen()),
          );
        }
      },
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
                    'Payment',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                actions: const [SizedBox(width: 50)],
              ),
              body: BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  return state is PaymentLoadingState
                      ? const CustomLoadingIndicator()
                      : Stack(
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    PaymentTypeCard(),
                                    const SizedBox(height: 15),
                                    PaymentEstimateCard(),
                                    const SizedBox(height: 15),
                                    PaymentAddressesCard(),
                                    const SizedBox(height: 180),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: PaymentButtonCard(),
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
