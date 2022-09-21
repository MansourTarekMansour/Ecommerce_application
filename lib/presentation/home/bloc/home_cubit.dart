import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/data/models/cart/cart_model.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/data/repositories/cart/cart_repository.dart';
import 'package:man_shop_app/data/repositories/home/home_repository.dart';
import 'package:man_shop_app/presentation/home/bloc/home_states.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepository) : super(HomeInitialState());

  late HomeModel homeModel;

  //late CategoriesModel categoriesModel;
  late HomeRepository homeRepository;


  int indicatorIndex = 0;
  final refreshController = RefreshController();

  Map<String, List<String>> categoriesBarData = {
    'images': [
      'assets/images/categories/electric.svg',
      'assets/images/categories/covid19.svg',
      'assets/images/categories/sports.svg',
      'assets/images/categories/lighting.svg',
      'assets/images/categories/clothes.svg',
    ],
    'names': [
      'Electric',
      'Covid-19',
      'Sports',
      'Lighting',
      'Clothes',
    ],
  };

  Future<void> getHomeData() async {
    emit(HomeGetDataLoadingState());
    try {
      homeModel = await homeRepository.getHomeData();
      emit(HomeSuccessState());
    } catch (error, s) {
      log('getHomeData error', error: error, stackTrace: s);
      emit(HomeErrorState(error.toString()));
    }
  }

  Future<void> onRefresh() async {
    emit(HomeGetDataLoadingState());

    await getHomeData();
    refreshController.refreshCompleted();
  }
  int productIndex({required int id}){
    for(int index = 0; index < homeModel.data.products.length; index++) {
      if (homeModel.data.products[index].id == id) {
        return index;
      }
    }
    return -1;
  }
  Future<void> isFavorites({required int id}) async {
    try {
      int index = productIndex(id: id);
      homeModel.data.products[index].inFavorites = !homeModel.data.products[index].inFavorites;
      String message = await homeRepository.isFavorite(id);
      emit(HomeSuccessState());
    } catch (error, s) {
      for(int i = 0; i < homeModel.data.products.length; i++) {
        if (homeModel.data.products[i].id == id) {
          homeModel.data.products[i].inFavorites = !homeModel.data.products[i].inFavorites;
          break;
        }
      }
      log('isFavorites error', error: error, stackTrace: s);
      emit(HomeErrorState(error.toString()));
    }
  }

  Future<void> inCart({required int id}) async {
    try {
      int index = productIndex(id: id);
      homeModel.data.products[index].inCart = await homeRepository.inCart(id);
      emit(HomeSuccessState());
    } catch (error, s) {
      log('HomeInCart error', error: error, stackTrace: s);
      emit(HomeErrorState(error.toString()));
    }
  }

  // Future<void> getCategoriesData() async {
  //   emit(HomeGatCategoriesLoadingState());
  //   try {
  //     categoriesModel = await homeRepository.getHomeCategories();
  //     emit(HomeSuccessState());
  //   } catch (error, s) {
  //     log('getCategoriesData error',error: error, stackTrace: s);
  //     emit(HomeErrorState(error.toString()));
  //   }
  // }

  void changeBannerIndex(index) {
    indicatorIndex = index;
    emit(ChangeBannerIndexState());
  }
}
