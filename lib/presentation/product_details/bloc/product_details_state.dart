part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {}

class ProductDetailsChangePhoto extends ProductDetailsState {}

class ChangeImgSliderVisibility extends ProductDetailsState {}
