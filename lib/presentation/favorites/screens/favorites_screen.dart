import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/favorites/bloc/favorites_cubit.dart';
import 'package:man_shop_app/shared/components/products_widget.dart';
import 'package:man_shop_app/shared/components/smart_refresh.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          bottom: false,
          child: Scaffold(
            body: state is FavoritesLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.blue,
                    ),
                  )
                : SmartRefresh(
                    topHeight: 70,
                    footerEnabled: true,
                    listLength: favoritesCubit.favoritesModel.data.length,
                    controller: favoritesCubit.refreshController,
                    onRefresh: () async {
                      await favoritesCubit.onRefresh.call();
                    },
                    idleIconColor: AppColors.mainColor,
                    waterDropColor: Colors.white,
                    child: SingleChildScrollView(
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
