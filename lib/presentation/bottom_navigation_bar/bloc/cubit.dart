import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/bloc/states.dart';
import 'package:man_shop_app/presentation/cart/screens/cart_screen.dart';
import 'package:man_shop_app/presentation/favorites/screens/favorites_screen.dart';
import 'package:man_shop_app/presentation/products/screens/products_screen.dart';
import 'package:man_shop_app/presentation/profile/screens/profile_screen.dart';
import 'package:man_shop_app/shared/styles/color.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarStates> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitialState());

  int currentIndex = 0;
  Color homeIconColor = iconColor;
  Color cardIconColor = Colors.black;
  Color favoriteIconColor = Colors.black;
  Color profileIconColor = Colors.black;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    const CartScreen(),
    FavoritesScreen(),
    const ProfileScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    homeIconColor = index == 0 ? iconColor : Colors.black;
    cardIconColor = index == 1 ? iconColor : Colors.black;
    favoriteIconColor = index == 2 ? iconColor : Colors.black;
    profileIconColor = index == 3 ? iconColor : Colors.black;
    emit(ChangeBottomState());
  }
}
