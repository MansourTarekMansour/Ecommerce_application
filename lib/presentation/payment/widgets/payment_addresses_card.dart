import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/address/bloc/address_cubit.dart';
import 'package:man_shop_app/presentation/address/screens/add_address_scren.dart';
import 'package:man_shop_app/presentation/address/screens/address_screen.dart';
import 'package:man_shop_app/presentation/payment/bloc/payment_cubit.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';

class PaymentAddressesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        final addressCubit = BlocProvider.of<AddressCubit>(context);
        return Container(
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
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Select your current address',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: addressCubit.addressModel!.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              paymentCubit.setAddressIndex(index, addressCubit.addressModel!.data[index].id);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: paymentCubit.addressIndex == index
                                    ? Colors.green.withOpacity(0.2)
                                    : Colors.grey[100],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(
                                  color: AppColors.mainColor.withOpacity(0.2),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10.5),
                                    child: SizedBox(
                                      height: 22,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            addressCubit
                                                .addressModel!.data[index].name,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const Spacer(),
                                          if (addressCubit.addressModel!
                                                  .data[index].menuOnPress ==
                                              true)
                                            IconButton(
                                              alignment: Alignment.bottomRight,
                                              onPressed: () {
                                                addressCubit
                                                    .emitMenuOnPress(index);
                                              },
                                              icon: SvgPicture.asset(
                                                'assets/icons/up_arrow.svg',
                                                color: Colors.grey,
                                                fit: BoxFit.fitWidth,
                                                height: 12,
                                              ),
                                            )
                                          else
                                            IconButton(
                                              alignment: Alignment.bottomRight,
                                              onPressed: () {
                                                addressCubit
                                                    .emitMenuOnPress(index);
                                              },
                                              icon: SvgPicture.asset(
                                                'assets/icons/down_arrow.svg',
                                                color: Colors.grey,
                                                fit: BoxFit.fitWidth,
                                                height: 12,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (addressCubit.addressModel!.data[index]
                                      .menuOnPress) ...[
                                    Container(
                                      height: 0.3,
                                      width: double.infinity,
                                      color: AppColors.mainColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                70,
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'City: ',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  child: Text(
                                                    BlocProvider.of<
                                                                AddressCubit>(
                                                            context)
                                                        .addressModel!
                                                        .data[index]
                                                        .city,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.grey),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(color: Colors.grey),
                                          Row(
                                            children: [
                                              const Text(
                                                'Region: ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Text(
                                                  addressCubit.addressModel!
                                                      .data[index].region,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(color: Colors.grey),
                                          Row(
                                            children: [
                                              const Text(
                                                'Details: ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Text(
                                                  addressCubit.addressModel!
                                                      .data[index].details,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (addressCubit.addressModel!
                                                  .data[index].notes !=
                                              null) ...[
                                            const Divider(color: Colors.grey),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Notes: ',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  child: Text(
                                                    BlocProvider.of<
                                                                AddressCubit>(
                                                            context)
                                                        .addressModel!
                                                        .data[index]
                                                        .notes!,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.grey),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 5);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddAddressScreen()),
                      );
                    },
                    text: 'Add new address',
                    height: 15,
                    buttonColor: Colors.grey.withOpacity(0.3),
                    textColor: Colors.black38,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
