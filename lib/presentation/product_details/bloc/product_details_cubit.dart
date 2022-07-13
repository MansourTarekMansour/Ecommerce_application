import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final sliderController = PageController();
  int currentImgIndex = 0;
  bool imgSliderVisibility = true;
  double imgSliderHeight = 319;

  void changeImgSliderVisibility(double height) {
    if (height >= 319) {
      imgSliderHeight = 0;
    } else {
      if (height <= 0) {
        imgSliderHeight = 319;
      } else {
        imgSliderHeight = 319 - height;
      }
    }
    emit(ChangeImgSliderVisibility());
  }

  void onImageChange(int index) {
    currentImgIndex = index;
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
}
