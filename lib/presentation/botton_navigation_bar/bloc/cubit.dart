import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/botton_navigation_bar/bloc/states.dart';
import 'package:man_shop_app/presentation/cart/screens/cart_screen.dart';
import 'package:man_shop_app/presentation/favorites/screens/favorites_screen.dart';
import 'package:man_shop_app/presentation/products/screens/products_screen.dart';
import 'package:man_shop_app/presentation/profile/screens/profile_screen.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarStates>{

  BottomNavigationBarCubit() : super(BottomNavigationBarInitialState());

  int currentIndex = 0;
  Color homeIconColor = Colors.white;
  Color cardIconColor = Colors.black;
  Color profileIconColor = Colors.black;

  List<Widget> bottomScreens =  [
     ProductsScreen(),
     const CartScreen(),
     FavoritesScreen(),
     const ProfileScreen(),
  ];
  void changeBottom(int index){
    currentIndex = index;
    index == 0? homeIconColor = Colors.white : homeIconColor = Colors.black;
    index == 1? cardIconColor = Colors.white : cardIconColor = Colors.black;
    index == 3? profileIconColor = Colors.white : profileIconColor = Colors.black;
    emit(ChangeBottomState());
  }


}