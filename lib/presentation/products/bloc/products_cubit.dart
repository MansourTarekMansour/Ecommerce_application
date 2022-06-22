import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/presentation/products/bloc/products_states.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/network/end_points.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';

class ProductsCubit extends Cubit<ProductsStates>{

  ProductsCubit() : super(ProductsInitialState());

  late HomeModel homeModel;

  Future<void> getHomeData() async {
    emit(ProductsLoadingState());
    try{
      final response = await DioHelper.getData(url: home, token: token);
      homeModel = HomeModel.fromJson(response!.data);
      log(response.data.toString());
      emit(ProductsSuccessState());
    }catch(error, s){
      log(error.toString());
      log(s.toString());
      emit(ProductsErrorState(error.toString()));
    }
  }

  int indicatorIndex = 0;
  void changeBannerIndex(index) {
    indicatorIndex = index;
    emit(ChangeBannerIndexState());

  }

}