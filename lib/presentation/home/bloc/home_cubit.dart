import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/data/repositories/home/home_repository.dart';
import 'package:man_shop_app/presentation/home/bloc/home_states.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/network/end_points.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepository) : super(HomeInitialState());

  late HomeModel homeModel;
  late HomeRepository homeRepository;

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    try {
      homeModel = await homeRepository.getHomeData();
      emit(HomeSuccessState());
    } catch (error, s) {
      log(error.toString());
      log(s.toString());
      emit(HomeErrorState(error.toString()));
    }
  }

  int indicatorIndex = 0;

  void changeBannerIndex(index) {
    indicatorIndex = index;
    emit(ChangeBannerIndexState());
  }
}
