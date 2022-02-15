abstract class ProductsStates{}
class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsSuccessState extends ProductsStates {}

class ProductsErrorState extends ProductsStates {
  final String error;
  ProductsErrorState(this.error);
}