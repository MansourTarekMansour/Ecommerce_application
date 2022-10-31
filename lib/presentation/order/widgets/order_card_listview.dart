import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/order/bloc/order_cubit.dart';

class OrderCardListView extends StatelessWidget {
  const OrderCardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderCubit = BlocProvider.of<OrderCubit>(context);
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orderCubit.orderModel!.data.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            //height: 80.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(color: AppColors.mainColor.withOpacity(0.2)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Order number: ",
                        style: TextStyle(
                          fontSize: 13,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        orderCubit.orderModel!.data[index].id.toString(),
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        orderCubit.orderModel!.data[index].date,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        "Total: ",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        orderCubit.orderModel!.data[index].total.toString(),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.blue,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "State: ",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        orderCubit.orderModel!.data[index].status.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
