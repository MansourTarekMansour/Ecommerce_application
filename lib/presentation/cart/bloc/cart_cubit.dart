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
  int popupMenuValue = 1;
  double totalPrice = 0;

  Future<void> getCartData() async {
    emit(CartLoadingState());
    try {
      cartModel = await cartRepository.getCartData();
      log('mansour ${cartModel.cartItems}');
      totalPrice = 0;
      for (int i = 0; i < cartModel.cartItems.length; i++) {
        products.add(cartModel.cartItems[i].product);
        totalPrice += products[i].price * products[i].itemCount;
      }
      emit(CartSuccessState());
    } catch (error, s) {
      log('getCartData error', error: error, stackTrace: s);
      emit(CartErrorState(error.toString()));
    }
  }
  Future<void> upgradeItemAmount({required int amount, required int id}) async {
    emit(CartLoadingState());
    try {
      await cartRepository.itemAmount(amount, id);
    } catch (error, s) {
      log('upgradeItemAmount error', error: error, stackTrace: s);
      emit(CartErrorState(error.toString()));
    }
  }

  Future<void> setOrder({required int amount, required int id}) async {
    emit(CartLoadingState());
    try {
      await cartRepository.itemAmount(amount, id);
    } catch (error, s) {
      log('upgradeItemAmount error', error: error, stackTrace: s);
      emit(CartErrorState(error.toString()));
    }
  }

  Future<void> onRefresh() async {
    emit(CartLoadingState());
    products.clear();
    await getCartData();
    refreshController.refreshCompleted();
  }
  double getTotalPrice(){
    double prices = 0;
    for (var e in products) {
      prices += e.price * e.itemCount;
    }
    return prices;
  }
  void setPopupMenuValue(int value, int index) {
    products[index].itemCount = value;
    cartModel.cartItems[index].quantity = value;
    upgradeItemAmount(amount: value, id: cartModel.cartItems[index].id);
    totalPrice = getTotalPrice();
    emit(CartSuccessState());
  }

}
