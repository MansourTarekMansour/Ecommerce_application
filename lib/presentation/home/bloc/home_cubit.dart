import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/data/models/home/categories_model.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/data/repositories/home/home_repository.dart';
import 'package:man_shop_app/presentation/home/bloc/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepository) : super(HomeInitialState());

  late HomeModel homeModel;
  //late CategoriesModel categoriesModel;
  late HomeRepository homeRepository;
  int indicatorIndex = 0;

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
