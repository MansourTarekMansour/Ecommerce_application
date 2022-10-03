import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/address/bloc/address_cubit.dart';
import 'package:man_shop_app/shared/components/delete_alert.dart';

class AddressesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressCubit = BlocProvider.of<AddressCubit>(context);
    return addressCubit.addressModel == null? const SizedBox():
      Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        itemCount: addressCubit.addressModel!.data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              addressCubit.emitMenuOnPress(index);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: addressCubit.addressModel!.data[index].menuOnPress &&
                      addressCubit.addressModel!.data[index].notes != null
                  ? 223
                  : addressCubit.addressModel!.data[index].menuOnPress
                      ? 186
                      : 60,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 17.5),
                    child: SizedBox(
                      height: 23,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 25,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.topLeft,
                              onPressed: () => showDialog(
                                context: context,
                                builder: (c) => DeleteAlert.svg(
                                  svgPath:
                                      'assets/icons/warning_alert_filled.svg',
                                  title: 'Are you sure',
                                  content: 'You want to delete this item',
                                  onPressed: () async {
                                    addressCubit.deleteAddress(index, addressCubit
                                        .addressModel!.data[index].id);
                                  },
                                ),
                              ),
                              icon: const Icon(
                                Icons.remove_circle_outline_sharp,
                                size: 23,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const Text(
                            ' -  ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            addressCubit.addressModel!.data[index].name,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          if (addressCubit
                                  .addressModel!.data[index].menuOnPress ==
                              true)
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SvgPicture.asset(
                                'assets/icons/up_arrow.svg',
                                color: Colors.grey,
                                fit: BoxFit.fitWidth,
                                height: 15,
                              ),
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SvgPicture.asset(
                                'assets/icons/down_arrow.svg',
                                color: Colors.grey,
                                fit: BoxFit.fitWidth,
                                height: 15,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  if (addressCubit.addressModel!.data[index].menuOnPress) ...[
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
                            width: MediaQuery.of(context).size.width - 30,
                            child: Row(
                              children: [
                                const Text(
                                  'City: ',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 131,
                                  child: Text(
                                    addressCubit.addressModel!.data[index].city,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 131,
                                child: Text(
                                  addressCubit.addressModel!.data[index].region,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          Row(
                            children: [
                              const Text(
                                'Details: ',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 131,
                                child: Text(
                                  addressCubit.addressModel!.data[index].details,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          if (addressCubit.addressModel!.data[index].notes !=
                              null) ...[
                            const Divider(color: Colors.grey),
                            Row(
                              children: [
                                const Text(
                                  'Notes: ',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 131,
                                  child: Text(
                                    addressCubit
                                        .addressModel!.data[index].notes!,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 15);
        },
      ),
    );
  }
}
