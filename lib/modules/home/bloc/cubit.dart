import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/modules/categories/screens/categories_screen.dart';
import 'package:man_shop_app/modules/favorites/screens/favorites_screen.dart';
import 'package:man_shop_app/modules/home/bloc/states.dart';
import 'package:man_shop_app/modules/products/screens/products_screen.dart';
import 'package:man_shop_app/modules/settings/screens/settings_screen.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() : super(HomeInitialState());

  // to take object from cubit
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];


}