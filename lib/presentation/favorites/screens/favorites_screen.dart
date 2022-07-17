import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/favorites/bloc/favorites_cubit.dart';
import 'package:man_shop_app/presentation/favorites/widgets/favorite_products_widget.dart';
import 'package:man_shop_app/presentation/home/widgets/products_widget.dart';

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
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70.0),
                      child: FavoriteProductsWidget(
                        products: favoritesCubit.favoritesModel.data,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
