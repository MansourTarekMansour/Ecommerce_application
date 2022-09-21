import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:man_shop_app/data/models/home/home_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  late Products products;
  final sliderController = PageController();
  int currentImgIndex = 0;
  int popupMenuValue = 1;
  bool imgSliderVisibility = true;
  double imgSliderHeight = 319;
  final double imgSliderConstHeight = 319;
  int productId = -1;
  int productIndex = 0;


  void changeImgSliderVisibility(double height) {
    if (height >= 319) {
      imgSliderHeight = 0;
    } else {
      if (height <= 0) {
        imgSliderHeight = imgSliderConstHeight;
      } else {
        imgSliderHeight = imgSliderConstHeight - height;
      }
    }
    emit(ChangeImgSliderVisibility());
  }
  void setPopupMenuValue(int value) {
    popupMenuValue = value;
    emit(ProductDetailsSuccess());
  }
  void onImageChange(int index) {
    currentImgIndex = index;
    sliderController.jumpToPage(index);
    emit(ProductDetailsChangePhoto());
  }

  void changeImgNext() {
    currentImgIndex++;
    emit(ProductDetailsChangePhoto());
  }

  void changeImgBack() {
    currentImgIndex--;
    emit(ProductDetailsChangePhoto());
  }
  void getHomeFavorite() {

    emit(ProductDetailsISFavorites());
  }


}
