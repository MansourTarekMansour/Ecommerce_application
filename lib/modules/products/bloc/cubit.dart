import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/modules/products/bloc/states.dart';

class ProductsCubit extends Cubit<ProductsStates>{

  ProductsCubit() : super(ProductsInitialState());

  // to take object from cubit
  static ProductsCubit get(context) => BlocProvider.of(context);


}