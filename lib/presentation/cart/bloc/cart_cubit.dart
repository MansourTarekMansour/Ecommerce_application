import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:man_shop_app/data/models/cart/cart_model.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';
import 'package:man_shop_app/data/repositories/cart/cart_repository.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepository) : super(CartInitial());
  late CartModel cartModel;
  CartRepository cartRepository;
  late List<Products> products = [];
  final refreshController = RefreshController();

  Future<void> getCartData() async {
    emit(CartLoadingState());
    try {
      cartModel = await cartRepository.getCartData();
      for(int i = 0; i < cartModel.cartItems.length; i++){
        products.add(cartModel.cartItems
        [i].product);
      }
      emit(CartSuccessState());
    } catch (error, s) {
      log('getCartData error', error: error, stackTrace: s);
      emit(CartErrorState(error.toString()));
    }
  }

  Future<void> onRefresh() async {
    emit(CartLoadingState());
    await getCartData();
    refreshController.refreshCompleted();
  }
}

