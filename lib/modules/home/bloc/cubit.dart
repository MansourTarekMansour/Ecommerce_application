import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/models/home/home_model.dart';
import 'package:man_shop_app/modules/cart/screens/cart_screen.dart';
import 'package:man_shop_app/modules/favorites/screens/favorites_screen.dart';
import 'package:man_shop_app/modules/home/bloc/states.dart';
import 'package:man_shop_app/modules/products/screens/products_screen.dart';
import 'package:man_shop_app/modules/profile/screens/profile_screen.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/network/end_points.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() : super(HomeInitialState());

  // to take object from cubit
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  Color homeIconColor = Colors.white;
  Color cardIconColor = Colors.black;
  Color profileIconColor = Colors.black;
  List<Widget> bottomScreens = const [
     ProductsScreen(),
     CartScreen(),
     FavoritesScreen(),
     ProfileScreen(),
  ];
  void changeBottom(int index){
    currentIndex = index;
    index == 0? homeIconColor = Colors.white : homeIconColor = Colors.black;
    index == 1? cardIconColor = Colors.white : cardIconColor = Colors.black;
    index == 3? profileIconColor = Colors.white : profileIconColor = Colors.black;
    emit(ChangeBottomState());
  }

  HomeModel? homeModel;
  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    try{
      final response = await DioHelper.getData(url: home, token: token);
      homeModel = HomeModel.fromJson(response?.data);
      //log(response!.data.toString());
      emit(HomeSuccessState());
    }catch(error, s){
      log(error.toString());
      log(s.toString());
      emit(HomeErrorState(error.toString()));
    }
  }

}