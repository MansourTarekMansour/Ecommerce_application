import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/bloc/states.dart';
import 'package:man_shop_app/presentation/bottom_navigation_bar/widgets/home_appbar.dart';
import 'package:man_shop_app/presentation/cart/screens/cart_screen.dart';
import 'package:man_shop_app/presentation/favorites/screens/favorites_screen.dart';
import 'package:man_shop_app/presentation/home/screens/home_screen.dart';
import 'package:man_shop_app/presentation/profile/screens/profile_screen.dart';
import 'package:man_shop_app/shared/styles/color.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarStates> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitialState());

  int currentIndex = 0;
  Color homeIconColor = iconColor;
  Color cardIconColor = Colors.black;
  Color favoriteIconColor = Colors.black;
  Color profileIconColor = Colors.black;
  bool scrollDown = false;

  List<Widget> pages = [
    const HomeScreen(),
    const CartScreen(),
    FavoritesScreen(),
    const ProfileScreen(),
  ];

  void scrollDirection({required bool scroll}){
    if(scrollDown != scroll){
      scrollDown = scroll;
      emit(BottomNavigationBarSuccessState());
    }
  }
  void changeBottom(int index) {
    currentIndex = index;
    homeIconColor = index == 0 ? iconColor : Colors.black;
    cardIconColor = index == 1 ? iconColor : Colors.black;
    favoriteIconColor = index == 2 ? iconColor : Colors.black;
    profileIconColor = index == 3 ? iconColor : Colors.black;
    emit(ChangeBottomState());
  }
}
