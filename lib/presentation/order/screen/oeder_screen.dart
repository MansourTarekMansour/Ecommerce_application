import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/order/bloc/order_cubit.dart';
import 'package:man_shop_app/presentation/order/widgets/order_card_listview.dart';
import 'package:man_shop_app/shared/components/custom_loading_indicator.dart';
import 'package:man_shop_app/shared/components/smart_refresh.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        final orderCubit = BlocProvider.of<OrderCubit>(context);
        return SafeArea(
          bottom: false,
          child: Scaffold(
            body: state is OrderLoadingState
                ? const CustomLoadingIndicator()
                : SmartRefresh(
                    topHeight: 70,
                    footerEnabled: false,
                    //listLength: favoritesCubit.favoritesModel.data.length,
                    controller: orderCubit.refreshController,
                    onRefresh: () async {},
                    idleIconColor: AppColors.mainColor,
                    waterDropColor: Colors.white,
                    child:
                        // favoritesCubit.products.isEmpty
                        //     ? const EmotyFavoritesCard()
                        //     :
                        SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 70),
                          OrderCardListView(),
                          const SizedBox(height: 70),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
