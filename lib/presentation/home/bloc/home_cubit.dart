import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/data/repositories/home/home_repository.dart';
import 'package:man_shop_app/presentation/home/bloc/home_states.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepository) : super(HomeInitialState());

  late HomeModel homeModel;

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
  Map<int, int> productsIndex = {};

  Future<void> getHomeData() async {
    emit(HomeGetDataLoadingState());
    try {
      homeModel = await homeRepository.getHomeData();
      getProductIndex();
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

  void getProductIndex() {
    for (int index = 0; index < homeModel.data.products.length; index++) {
      productsIndex[homeModel.data.products[index].id] = index;
    }
  }

  Future<void> isFavorites({required int id}) async {
    homeModel.data.products[productsIndex[id]!].inFavorites =
        !homeModel.data.products[productsIndex[id]!].inFavorites;
    emit(HomeSuccessState());
    try {
      await homeRepository.isFavorite(id);
      emit(HomeSuccessState());
    } catch (error, s) {
      homeModel.data.products[productsIndex[id]!].inFavorites =
          !homeModel.data.products[productsIndex[id]!].inFavorites;
      log('isFavorites error', error: error, stackTrace: s);
      emit(HomeErrorState(error.toString()));
    }
  }

  Future<void> inCart({required int id}) async {
    homeModel.data.products[productsIndex[id]!].inCart =
        !homeModel.data.products[productsIndex[id]!].inCart;
    emit(HomeSuccessState());
    try {
      await homeRepository.inCart(id);
      emit(HomeSuccessState());
    } catch (error, s) {
      homeModel.data.products[productsIndex[id]!].inCart =
          !homeModel.data.products[productsIndex[id]!].inCart;
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
