import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/features/home/data/models/categories_model.dart';
import 'package:man_shop_app/features/home/data/models/home_model.dart';
import 'package:man_shop_app/features/home/data/repositories/home_repository.dart';
import 'package:man_shop_app/features/home/presentation/bloc/home_states.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepository) : super(HomeInitialState());

  late HomeModel homeModel;
  late CategoriesModel categoriesModel;
  late HomeRepository homeRepository;
  int indicatorIndex = 0;

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    try {
      homeModel = await homeRepository.getHomeData();
      categoriesModel = await homeRepository.getHomeCategories();
      emit(HomeSuccessState());
    } catch (error, s) {
      log(error.toString());
      log(s.toString());
      emit(HomeErrorState(error.toString()));
    }
  }

  void changeBannerIndex(index) {
    indicatorIndex = index;
    emit(ChangeBannerIndexState());
  }
}
