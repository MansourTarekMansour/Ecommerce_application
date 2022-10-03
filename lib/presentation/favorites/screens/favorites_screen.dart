import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/favorites/bloc/favorites_cubit.dart';
import 'package:man_shop_app/presentation/favorites/widgets/empty_favorites_card.dart';
import 'package:man_shop_app/shared/components/custom_loading_indicator.dart';
import 'package:man_shop_app/shared/components/products_widget.dart';
import 'package:man_shop_app/shared/components/smart_refresh.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesCubit = BlocProvider.of<FavoritesCubit>(context)..onRefresh();
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          bottom: false,
          child: Scaffold(
            body: state is FavoritesLoading
                ? const CustomLoadingIndicator()
                : SmartRefresh(
                    topHeight: 70,
                    footerEnabled: false,
                    listLength: favoritesCubit.favoritesModel.data.length,
                    controller: favoritesCubit.refreshController,
                    onRefresh: () async {
                      await favoritesCubit.onRefresh.call();
                    },
                    idleIconColor: AppColors.mainColor,
                    waterDropColor: Colors.white,
                    child: favoritesCubit.products.isEmpty
                        ? const EmotyFavoritesCard()
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 70.0),
                              child: ProductsWidget(
                                products: favoritesCubit.products,
                                isFavorite: true,
                              ),
                            ),
                          ),
                  ),
          ),
        );
      },
    );
  }
}
